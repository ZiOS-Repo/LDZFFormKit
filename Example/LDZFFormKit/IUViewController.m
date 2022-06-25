//
//  IUViewController.m
//  IU_FormKit
//
//  Created by zhuyuhui434@gmail.com on 06/12/2021.
//  Copyright (c) 2021 zhuyuhui434@gmail.com. All rights reserved.
//

#import "IUViewController.h"
#import <Masonry/Masonry.h>
#import <LDZFFormKit/QnmFormUIManagementHeader.h>
#import "FormUIManagement.h"
#import "FormUIMAdapter.h"
#import "FormUIMEventHandle.h"

@interface IUViewController ()
@property(nonatomic, strong) FormUIMAdapter *tableAdapter;
@property(nonatomic, strong) FormUIMEventHandle *eventHandler;
@end

@implementation IUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ldzfInitSubviews];
    [self bindViewModel];
}
    
- (void)ldzfInitSubviews {
    [self createTableViewWithStyle:UITableViewStylePlain];
}


- (void)createTableViewWithStyle:(UITableViewStyle)style {
    [self createTableViewWithFrame:self.view.bounds style:style];
}

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self createTableView:UITableView.class withFrame:frame style:style];
}

- (void)createTableView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self.recylerView removeFromSuperview];
    self.recylerView = nil;
    self.recylerView = [self preferredRecylerView:viewClass withFrame:frame style:style];
    [self.view addSubview:self.recylerView];
    [self.recylerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.recylerView.superview);
    }];
}

#pragma mark - getter
- (UITableView *)preferredRecylerView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    UITableView *recylerView = [[viewClass alloc] initWithFrame:frame style:style];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.separatorStyle = UITableViewCellSeparatorStyleNone;
    recylerView.showsVerticalScrollIndicator = NO;
    recylerView.showsHorizontalScrollIndicator = NO;
    return recylerView;
}

#pragma mark - bindViewModel
- (void)bindViewModel {
    //使用JSON加载
//    NSDictionary *dic = [self readLocalFileWithName:@"QnmFormTemplates"];
//    QnmFormUIModel *model = [QnmFormUIModel yy_modelWithDictionary:dic];

    
    
    //一个个添加
    NSMutableArray <QnmFormItemModel *> *modules = [NSMutableArray array];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaKV;
        item.valueScheme.title = @"姓名";
        item.valueScheme.propertyName = @"userName";
        item.valueScheme.value = @"张三";
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaDate;
        item.valueScheme.title = @"出生日期";
        item.valueScheme.propertyName = @"birthdayDate";
        item.valueScheme.placeholder = @"请选择";
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaSingleChoice;
        item.valueScheme.title = @"喜好";
        item.valueScheme.propertyName = @"like";
        item.valueScheme.placeholder = @"请选择";
        item.valueScheme.enums = @[@"旅游",@"爬山",@"游泳",@"骑行",@"电竞"];
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaSwitch;
        item.valueScheme.title = @"是否已婚";
        item.valueScheme.propertyName = @"isYiHun";
        item.valueScheme.value = @"1";
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaTextfiled;
        item.valueScheme.title = @"住址";
        item.valueScheme.propertyName = @"address";
        item.valueScheme.value = @"上海浦东新区张江镇";
        item.valueScheme.placeholder = @"请输入";
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaTextView;
        item.valueScheme.title = @"反馈建议";
        item.valueScheme.propertyName = @"feedback";
        item.valueScheme.value = @"";
        item.valueScheme.placeholder = @"请输入";
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaSlider;
        item.height = 44;
        item.mutableHeight = 44;
        item.valueScheme.title = @"设置阈值";
        item.valueScheme.propertyName = @"yuzhi";
        item.valueScheme.minimum = @"0";
        item.valueScheme.maximum = @"100";
        item.valueScheme.value = @"";
        [modules addObject:item];
    }];
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaPlusReduce;
        item.valueScheme.title = @"数量";
        item.valueScheme.propertyName = @"totalNum";
        item.valueScheme.value = @"0";
        [modules addObject:item];
    }];
    
    
    
    
    [QnmFormItemUtils createT:^(QnmFormItemModel * _Nonnull item) {
        item.type = QnmFormItemOaSubmit;
//        item.valueScheme.title = @"反馈建议";
//        item.valueScheme.propertyName = @"feedback";
//        item.valueScheme.value = @"";
//        item.valueScheme.placeholder = @"请输入";
        [modules addObject:item];
    }];
    
    
    QnmFormUIModel *model = [QnmFormUIModel yy_modelWithDictionary:@{}];
    model.modules = modules;
    
    self.recylerView.delegate = self.tableAdapter;
    self.recylerView.dataSource = self.tableAdapter;
    [self.tableAdapter setDataModel:model forTableView:self.recylerView];
}


- (FormUIMAdapter *)tableAdapter {
    if (!_tableAdapter) {
        _tableAdapter = [[FormUIMAdapter alloc] initWithManagerClass:FormUIManagement.class];
        _tableAdapter.eventDelegate = self.eventHandler;
    }
    return _tableAdapter;
}

- (FormUIMEventHandle *)eventHandler {
    if (!_eventHandler) {
        _eventHandler = [[FormUIMEventHandle alloc] init];
        _eventHandler.eventHandlerDelegate = self.tableAdapter;
    }
    return _eventHandler;
}




// 读取本地JSON文件
- (id)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}

@end

