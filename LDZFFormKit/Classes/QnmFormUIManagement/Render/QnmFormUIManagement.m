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
    if ([model.type isEqualToString:@"KV"]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:@"Date"]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:@"SingleChoice"]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:@"MultiChoice"]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:@"Slider"]) {
        if (model.ifExpand) {
            return model.height + model.mutableHeight;
        }
        return model.height;
    }
    else if ([model.type isEqualToString:@"Switch"]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:@"Textfiled"]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:@"TextView"]) {
        return 16 * 2 + 100;
    }
    else if ([model.type isEqualToString:@"Submit"]) {
        return 54.f;
    }
    
    return model.height;
}

+ (BOOL)isCellReusableForModuleType:(NSString *)type {
    return NO;
}
@end
