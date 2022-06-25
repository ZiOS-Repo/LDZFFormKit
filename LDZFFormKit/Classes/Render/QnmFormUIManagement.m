//
//  QnmFormUIManagement.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIManagement.h"
#import "QnmFormConstDefine.h"
@implementation QnmFormUIManagement

+ (NSString *)cellClassForModuleType:(NSString *)type {
    return [NSString stringWithFormat:@"QnmForm%@Cell",type];
}

+ (NSString *)viewClassForModuleType:(NSString *)type {
    return [NSString stringWithFormat:@"QnmForm%@View",type];
}

+ (CGFloat)heightForModule:(QnmFormItemModel *)model {
    if ([model.type isEqualToString:QnmFormItemOaKV]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaDate]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaSingleChoice]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaMultiChoice]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaSwitch]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaPlusReduce]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaTextfiled]) {
        return 44.f;
    }
    else if ([model.type isEqualToString:QnmFormItemOaSlider]) {
        if (model.ifExpand) {
            return model.height + model.mutableHeight;
        }
        return model.height;
    }
    else if ([model.type isEqualToString:QnmFormItemOaTextView]) {
        return 16 * 2 + 100;
    }
    else if ([model.type isEqualToString:QnmFormItemOaSubmit]) {
        return 54.f;
    }

    return model.height;
}

+ (BOOL)isCellReusableForModuleType:(NSString *)type {
    return NO;
}
@end
