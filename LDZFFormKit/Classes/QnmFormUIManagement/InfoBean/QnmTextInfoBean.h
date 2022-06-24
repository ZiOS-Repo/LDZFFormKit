//
//  QnmTextInfoBean.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import <Foundation/Foundation.h>
#import <LDZFCommon/LDZFCommon.h>
NS_ASSUME_NONNULL_BEGIN

@interface QnmTextInfoBean : NSObject
/// 显示的文本
@property(nonatomic, copy) NSString *text;

/// 文本颜色
@property(nonatomic, copy) NSString *color;

/// 文本大小
@property(nonatomic, assign) CGFloat fontSize;

/// 文本最大宽度
@property(nonatomic, assign) CGFloat maxWidth;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
