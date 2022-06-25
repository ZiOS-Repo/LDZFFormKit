//
//  QnmFormUIMEventProtocol.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import "QnmFormItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol QnmFormUIMEventProtocol <NSObject>

@optional
/**
 模板中的通用操作事件跳转
 
 @param model 持有的模块数据
 @param moduleIndex -1 表示行模块本身; >=0 表示子模块索引index
 @return 返回值表示是否处理事件，YES处理；NO不处理
 */
- (BOOL)eventCommonOperationWithModel:(QnmFormItemModel *)model moduleIndex:(NSInteger)moduleIndex;

/**
 模板中的自定义操作事件跳转

 @param model 持有的模块数据
 @param infoDic 传递的自定义数据
 @return 返回值表示是否处理事件，YES处理；NO不处理
 */
- (BOOL)eventCustomOperationWithModel:(QnmFormItemModel *)model info:(NSDictionary *)infoDic;

/**
 ScrollView滑动事件

 @param scrollView 滑动的Scroll视图
 */
- (void)qnmFormScrollViewDidScroll:(UIScrollView *)scrollView;
@end




@protocol QnmFormUIMDataOffsetProtocol <NSObject>

@optional
/** 界面管理数据对象baseModules可能不是从tableView的第一个cell开始的；
 *  也可能不是scrollView第一个需要渲染的子视图。
 *  modelTopOffset代表界面管理数据开始的cell相对tableView的偏移；
 *  或者界面管理的子视图相对父视图scrollView的偏移。
 *  默认为0。
 */
@property (nonatomic) NSInteger modelTopOffset;

/** 界面管理数据对象baseModules可能不是到tableView的最后一个cell结束的；
 *  也可能不是scrollView最后一个需要渲染的子视图。
 *  modelBottomOffset代表界面管理数据最后一个的cell相对tableView的偏移；
 *  或者界面管理的子视图相对父视图scrollView的偏移。
 *  默认为0。
 */
@property (nonatomic) NSInteger modelBottomOffset;

@end

NS_ASSUME_NONNULL_END
