//
//  QnmTextInfoBean.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmTextInfoBean.h"

@implementation QnmTextInfoBean

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
    if ([key isEqualToString:@"text"]) {
        self.text = value;
    }
    else if ([key isEqualToString:@"color"]) {
        self.color = value;
    }
    else if ([key isEqualToString:@"fontSize"]) {
        self.fontSize = [safeString(value) floatValue];
    }
    else if ([key isEqualToString:@"maxWidth"]) {
        self.maxWidth = [safeString(value) floatValue];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}


@end

