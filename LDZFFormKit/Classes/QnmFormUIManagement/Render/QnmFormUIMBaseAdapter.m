//
//  QnmFormUIMBaseAdapter.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIMBaseAdapter.h"
#import "QnmFormUIMTemplateCell.h"
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormUIManagement.h"
@interface QnmFormUIMBaseAdapter()
@property (nonatomic, strong, readwrite) QnmFormUIModel *baseModules;
@property (nonatomic, strong) Class managerClass;
@end

@implementation QnmFormUIMBaseAdapter

#pragma mark - init & dealloc
- (instancetype)init {
    self = [super init];
    if (self) {
        _managerClass = [QnmFormUIManagement class];
    }

    return self;
}

- (instancetype)initWithManagerClass:(Class)className {
    self = [super init];
    if (self) {
        _managerClass = className;
    }

    return self;
}

- (void)dealloc {
    _eventDelegate = nil;
    _baseModules = nil;
    _managerClass = nil;
}

#pragma mark - public
- (void)setDataModel:(nullable QnmFormUIModel *)model forTableView:(UITableView *)tableView {
    self.baseModules = model;
    NSMutableArray *tempMutArr = [NSMutableArray arrayWithCapacity:self.baseModules.modules.count]; //需要显示的行模块
    if ([self.managerClass respondsToSelector:@selector(cellClassForModuleType:)]) {
        for (QnmFormItemModel *subModule in self.baseModules.modules) {
            if (!subModule.invisible) {
                [tempMutArr addObject:subModule];
            } else {
                continue;
            }
            NSString *classNameStr = [self.managerClass cellClassForModuleType:subModule.type];
            if (classNameStr) {
                Class className = NSClassFromString(classNameStr);
                BOOL isReusable = NO;
                if ([self.managerClass respondsToSelector:@selector(isCellReusableForModuleType:)]) {
                    isReusable = [self.managerClass isCellReusableForModuleType:subModule.type];
                }
                subModule.refreshNotReusableCell = YES;
                if (isReusable && className && [className respondsToSelector:@selector(reuseCellIdentifier)]) {
                    [tableView registerClass:className forCellReuseIdentifier:[className reuseCellIdentifier]];
                } else if (!isReusable && className && [className respondsToSelector:@selector(nonReuseCellWithIdentifier:)]) {
                    NSUInteger index = [tempMutArr indexOfObject:subModule];
                    NSString *indexIdentifier = [NSString stringWithFormat:@"%lu", (unsigned long)(index + self.modelTopOffset)];
                    [tableView registerClass:className forCellReuseIdentifier:[className nonReuseCellWithIdentifier:indexIdentifier]];
                }
            }
        }
        self.baseModules.modules = tempMutArr.copy;
        
        //当前界管有行模块并且当前控制器无顶部自定义cell 且当前tableView的orign.y从0开始时
        if (self.baseModules.modules.count > 0 && self.modelTopOffset == 0 && tableView.frame.origin.y == 0) {
            self.baseModules.modules.firstObject.index = @"0";//标记界管第一条数据
        }
    }
}

#pragma mark - SRSUIMDataSourceOffsetProtocol
- (NSInteger)modelTopOffset {
    return 0;
}

- (NSInteger)modelBottomOffset {
    return 0;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.baseModules.modules.count + self.modelTopOffset + self.modelBottomOffset;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row >= self.modelTopOffset && indexPath.row < self.baseModules.modules.count + self.modelTopOffset) {
        QnmFormItemModel *subModule = [self.baseModules.modules objectAtIndex:indexPath.row - self.modelTopOffset];
        NSString *classNameStr = nil;
        if ([self.managerClass respondsToSelector:@selector(cellClassForModuleType:)]) {
            classNameStr = [self.managerClass cellClassForModuleType:subModule.type];
        }

        if (classNameStr) {
            Class className = NSClassFromString(classNameStr);
            BOOL isReusable = NO;
            if ([self.managerClass respondsToSelector:@selector(isCellReusableForModuleType:)]) {
                isReusable = [self.managerClass isCellReusableForModuleType:subModule.type];
            }

            if (isReusable && className && [className respondsToSelector:@selector(reuseCellIdentifier)]) {
                cell = [tableView dequeueReusableCellWithIdentifier:[className reuseCellIdentifier] forIndexPath:indexPath];
            } else if (!isReusable && className && [className respondsToSelector:@selector(nonReuseCellWithIdentifier:)]) {
                NSUInteger index = [self.baseModules.modules indexOfObject:subModule];
                NSString *indexIdentifier = [NSString stringWithFormat:@"%lu", (unsigned long)(index + self.modelTopOffset)];
                @try {
                    cell = [tableView dequeueReusableCellWithIdentifier:[className nonReuseCellWithIdentifier:indexIdentifier] forIndexPath:indexPath];
                }
                @catch(NSException *e) {
                    [tableView registerClass:className forCellReuseIdentifier:[className nonReuseCellWithIdentifier:indexIdentifier]];
                }
            }

            if ([cell isKindOfClass:[QnmFormUIMTemplateCell class]]) {
                QnmFormUIMTemplateCell *oneCell = (QnmFormUIMTemplateCell *)cell;
                [oneCell configureWithModel:subModule];
                //新模板的cell,其点击跳转和数据采集都暴露给外部处理，不在cell内部做额外处理
                __weak __typeof(self)weakSelf = self;
                [oneCell setCustomOperation:^(NSDictionary *_Nonnull dicInfo, QnmFormUIMTemplateCell *_Nonnull senderCell) {
                    __strong __typeof(weakSelf)strongSelf = weakSelf;
                    if ([strongSelf.eventDelegate respondsToSelector:@selector(eventCustomOperationWithModel:info:)]) {
                        [strongSelf.eventDelegate eventCustomOperationWithModel:senderCell.holdModel info:dicInfo];
                    }
                }];

                __weak typeof(UITableView) * weakTable = tableView;
                [oneCell setReloadOperation:^(NSInteger operation, QnmFormUIMTemplateCell *_Nonnull senderCell) {
                    __strong __typeof(&*weakTable) strongTable = weakTable;
                    __strong __typeof(weakSelf)strongSelf = weakSelf;
                    switch (operation) {
                        case 0: //列表刷新Cell高度
                            {
                                if (indexPath.row < (strongSelf.baseModules.modules.count + strongSelf.modelTopOffset + strongSelf.modelBottomOffset)) {
                                    [strongTable beginUpdates];
                                    [strongTable endUpdates];
                                }
                            }
                            break;
                        case 1: //局部刷新Cell重走configureWithModel
                            {
                                UITableViewCell *cell = [strongTable cellForRowAtIndexPath:indexPath];
                                if (cell) {
                                    [UIView performWithoutAnimation:^{
                                        [strongTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                                    }];
                                }
                            }
                            break;

                        default:
                            break;
                    }
                }];
            }
        }
    }
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)srstableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.modelTopOffset && indexPath.row < self.baseModules.modules.count + self.modelTopOffset) {
        QnmFormItemModel *subModule = [self.baseModules.modules objectAtIndex:indexPath.row - self.modelTopOffset];
        if (subModule.ifHidden) {
            return 0.f;
        }
        if ([self.managerClass respondsToSelector:@selector(heightForModule:)]) {
            return [self.managerClass heightForModule:subModule];
        }
    }
    return 0.f;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 停止类型1、停止类型2
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        // 停止类型3
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    //停止类型4
    [self scrollViewDidEndScroll];
}

#pragma mark - scrollView 滚动停止
- (void)scrollViewDidEndScroll {}


@end
