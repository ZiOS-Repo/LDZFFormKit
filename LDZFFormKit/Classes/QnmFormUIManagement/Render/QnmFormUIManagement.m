//
//  QnmFormUIManagement.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIManagement.h"

@implementation QnmFormUIManagement

+ (NSString *)cellClassForModuleType:(NSString *)type {
    return [NSString stringWithFormat:@"QnmForm%@Cell",type];
}

+ (NSString *)viewClassForModuleType:(NSString *)type {
    return [NSString stringWithFormat:@"QnmForm%@View",type];
}

+ (CGFloat)heightForModule:(QnmFormItemModel *)model {
    return model.height;
}

+ (BOOL)isCellReusableForModuleType:(NSString *)type {
    return NO;
}
@end
