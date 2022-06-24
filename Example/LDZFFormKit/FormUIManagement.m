//
//  FormUIManagement.m
//  LDZFFormKit_Example
//
//  Created by zhuyuhui on 2022/6/23.
//  Copyright © 2022 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormUIManagement.h"

@implementation FormUIManagement
+ (NSString *)cellClassForModuleType:(NSString *)type {
    return [super cellClassForModuleType:type];
}

+ (NSString *)viewClassForModuleType:(NSString *)type {
    return [super viewClassForModuleType:type];
}

+ (CGFloat)heightForModule:(QnmFormItemModel *)model {
    if ([model.type isEqualToString:@"KV"]) {
        
    }
    else if ([model.type isEqualToString:@"Picker"]) {
        
    }
    else if ([model.type isEqualToString:@"Slider"]) {
        
    }
    else if ([model.type isEqualToString:@"Switch"]) {
        
    }
    else if ([model.type isEqualToString:@"Textfiled"]) {
        NSLog(@"");
    }
    else if ([model.type isEqualToString:@"TextView"]) {
        return 16 * 2 + 100;
    }
    return 44.f;
}
@end
