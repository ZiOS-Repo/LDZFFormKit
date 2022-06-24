//
//  QnmFormItemModel.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import <LDZFCommon/LDZFCommon.h>
#import "QnmFormItemUIScheme.h"
#import "QnmFormItemValueScheme.h"
NS_ASSUME_NONNULL_BEGIN

@interface QnmFormItemModel : NSObject
///模板ID
@property (nonatomic, copy) NSString *moduleId;
///当前模块类型编号
@property (nonatomic, copy) NSString *type;
///模块高度
@property(nonatomic, assign) CGFloat height;
///模块可变高度
@property(nonatomic, assign) CGFloat mutableHeight;
///模块宽度
@property(nonatomic, assign) CGFloat width;
///模块隐藏标识
@property(nonatomic, assign) BOOL invisible;
///是否隐藏 值为1时是隐藏
@property(nonatomic, assign) BOOL ifHidden;
///是否展开
@property(nonatomic, assign) BOOL ifExpand;
///当前模块的序号
@property (nonatomic, copy) NSString *index;
///
@property(nonatomic, strong) QnmFormItemUIScheme *uiScheme;

@property(nonatomic, strong) QnmFormItemValueScheme *valueScheme;

//---------------  模块是否需要刷新  ---------------
//重新set tableview数据时, 强制刷新重绘不可重用的cell
@property (nonatomic, assign) BOOL refreshNotReusableCell;

@end

NS_ASSUME_NONNULL_END
