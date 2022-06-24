//
//  QnmFormUIManagement.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import "QnmFormItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QnmFormUIManagement : NSObject

+ (NSString *)cellClassForModuleType:(NSString *)type;
+ (NSString *)viewClassForModuleType:(NSString *)type;
+ (CGFloat)heightForModule:(QnmFormItemModel *)model;
+ (BOOL)isCellReusableForModuleType:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
