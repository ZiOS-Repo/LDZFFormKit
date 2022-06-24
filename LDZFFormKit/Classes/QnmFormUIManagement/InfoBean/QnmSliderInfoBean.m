//
//  QnmSliderInfoBean.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmSliderInfoBean.h"

@implementation QnmSliderInfoBean
- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"value"]) {
        self.value = [safeString(value) floatValue];
    }
    else if ([key isEqualToString:@"minimumValue"]) {
        self.minimumValue = [safeString(value) floatValue];
    }
    else if ([key isEqualToString:@"maximumValue"]) {
        self.maximumValue = [safeString(value) floatValue];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}


@end
