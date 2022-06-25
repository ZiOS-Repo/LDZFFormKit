//
//  QnmFormItemUIScheme.m
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/22.
//

#import "QnmFormItemUIScheme.h"


#define keyboardTypes @{\
@"Default":@(UIKeyboardTypeDefault),\
@"ASCIICapable":@(UIKeyboardTypeASCIICapable),\
@"NumbersAndPunctuation":@(UIKeyboardTypeNumbersAndPunctuation),\
@"URL":@(UIKeyboardTypeURL),\
@"NumberPad":@(UIKeyboardTypeNumberPad),\
@"PhonePad":@(UIKeyboardTypePhonePad),\
@"NamePhonePad":@(UIKeyboardTypeNamePhonePad),\
@"EmailAddress":@(UIKeyboardTypeEmailAddress),\
@"DecimalPad":@(UIKeyboardTypeDecimalPad),\
@"Twitter":@(UIKeyboardTypeTwitter),\
@"WebSearch":@(UIKeyboardTypeWebSearch),\
}\

#define returnKeyTypes @{\
@"Default":@(UIReturnKeyDefault),\
@"Go":@(UIReturnKeyGo),\
@"Google":@(UIReturnKeyGoogle),\
@"Join":@(UIReturnKeyJoin),\
@"Next":@(UIReturnKeyNext),\
@"Route":@(UIReturnKeyRoute),\
@"Search":@(UIReturnKeySearch),\
@"Send":@(UIReturnKeySend),\
@"Yahoo":@(UIReturnKeyYahoo),\
@"Done":@(UIReturnKeyDone),\
@"EmergencyCall":@(UIReturnKeyEmergencyCall),\
@"Continue":@(UIReturnKeyContinue)\
}\


NSString * Holder(NSString * org,NSString * placeholder){
    return org ? org : placeholder;
}

@implementation QnmFormTextUIScheme
- (UIColor *)qnm_color {
    return kStringColor(Holder(self.color,@"#FF333333"));
}
- (UIFont *)qnm_font {
    return [UIFont systemFontOfSize:[Holder(self.font,@"15") floatValue]];
}
- (CGFloat)qnm_widthRatio {
    return [Holder(self.widthRatio,@"1") floatValue];
}

@end
@implementation QnmFormTextfiledUIScheme
- (UIColor *)qnm_color {
    return kStringColor(Holder(self.color,@"#FF333333"));
}
- (UIFont *)qnm_font {
    return [UIFont systemFontOfSize:[Holder(self.font,@"15") floatValue]];
}
- (UIColor *)qnm_placeholderTextColor {
    return kStringColor(Holder(self.placeholderTextColor,@"#66333333"));
}
- (UIFont *)qnm_placeholderFont {
    return [UIFont systemFontOfSize:[Holder(self.placeholderFont,@"14") floatValue]];
}
- (UIKeyboardType)qnm_keyboardType {
    NSNumber *val = keyboardTypes[self.keyboardType];
    return val ? val.integerValue : UIKeyboardTypeDefault;
}
- (UIReturnKeyType)qnm_returnKeyType {
    NSNumber *val = returnKeyTypes[self.returnKeyType];
    return val ? val.integerValue : UIReturnKeyDefault;
}
@end
@implementation QnmFormTextViewUIScheme
- (UIColor *)qnm_color {
    return kStringColor(Holder(self.color,@"#FF333333"));
}
- (UIFont *)qnm_font {
    return [UIFont systemFontOfSize:[Holder(self.font,@"15") floatValue]];
}
- (UIColor *)qnm_placeholderTextColor {
    return kStringColor(Holder(self.placeholderTextColor,@"#66333333"));
}
- (UIFont *)qnm_placeholderFont {
    return [UIFont systemFontOfSize:[Holder(self.placeholderFont,@"14") floatValue]];
}
- (UIKeyboardType)qnm_keyboardType {
    NSNumber *val = keyboardTypes[self.keyboardType];
    return val ? val.integerValue : UIKeyboardTypeDefault;
}
- (UIReturnKeyType)qnm_returnKeyType {
    NSNumber *val = returnKeyTypes[self.returnKeyType];
    return val ? val.integerValue : UIReturnKeyDefault;
}
@end
@implementation QnmFormSwitchUIScheme
- (UIColor *)qnm_onTintColor {
    return kStringColor(Holder(self.onTintColor,@"#FF333333"));
}
- (UIColor *)qnm_thumbTintColor {
    return kStringColor(Holder(self.thumbTintColor,@"#FF333333"));
}
@end
@implementation QnmFormSliderUIScheme
- (UIColor *)qnm_minimumTrackTintColor {
    return kStringColor(Holder(self.minimumTrackTintColor,@"#FF0000FF"));
}
- (UIColor *)qnm_maximumTrackTintColor {
    return kStringColor(Holder(self.maximumTrackTintColor,@"#FFFFFFFF"));
}
- (UIColor *)qnm_thumbTintColor {
    return kStringColor(Holder(self.thumbTintColor,@"#FFFFFFFF"));
}
@end
@implementation QnmFormDivisionUIScheme
- (UIColor *)qnm_color {
    return kStringColor(Holder(self.color,@"#FFEEEEEE"));
}
- (BOOL)qnm_invisible {
    return [Holder(self.invisible,@"1") isEqualToString:@"1"];
}
- (UIEdgeInsets )qnm_insets {
    return UIEdgeInsetsFromString(Holder(self.insets,@"{0, 12, 0, 12}"));
}
@end
@implementation QnmFormPlusReduceScheme
- (UIColor *)qnm_color {
    return kStringColor(Holder(self.color,@"#FF333333"));
}
- (UIFont *)qnm_font {
    return [UIFont systemFontOfSize:[Holder(self.font,@"15") floatValue]];
}
- (UIColor *)qnm_placeholderTextColor {
    return kStringColor(Holder(self.placeholderTextColor,@"#66333333"));
}
- (UIFont *)qnm_placeholderFont {
    return [UIFont systemFontOfSize:[Holder(self.placeholderFont,@"14") floatValue]];
}
- (UIKeyboardType)qnm_keyboardType {
    NSNumber *val = keyboardTypes[self.keyboardType];
    return val ? val.integerValue : UIKeyboardTypeDefault;
}
- (UIReturnKeyType)qnm_returnKeyType {
    NSNumber *val = returnKeyTypes[self.returnKeyType];
    return val ? val.integerValue : UIReturnKeyDefault;
}
- (BOOL)qnm_reduceEnable {
    return [Holder(self.reduceEnable,@"1") isEqualToString:@"1"];
}
- (BOOL)qnm_plusEnable {
    return [Holder(self.plusEnable,@"1") isEqualToString:@"1"];
}
- (CGFloat)qnm_inputBoxWidth {
    return [Holder(self.inputBoxWidth,@"50") floatValue];
}
@end


@implementation QnmFormItemUIScheme

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"titleIN" : QnmFormTextUIScheme.class,
        @"subtitleIN" : QnmFormTextUIScheme.class,
        @"placeholderIN" : QnmFormTextUIScheme.class,
        @"textfiledIN" : QnmFormTextfiledUIScheme.class,
        @"textViewIN" : QnmFormTextViewUIScheme.class,
        @"switchIN" : QnmFormSwitchUIScheme.class,
        @"sliderIN" : QnmFormSliderUIScheme.class,
        @"divisionIN" : QnmFormDivisionUIScheme.class,
        @"plusReduceIN" : QnmFormPlusReduceScheme.class,
    };
}

// JSON 转为 Model 完成后，该方法会被调用，返回false该model会被忽略
// 同时可以在该model中做一些，转换不能实现的操作，如NSDate类型转换
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if (![dic.allKeys containsObject:@"titleIN"]) {
        self.titleIN = [QnmFormTextUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"subtitleIN"]) {
        self.subtitleIN = [QnmFormTextUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"placeholderIN"]) {
        self.placeholderIN = [QnmFormTextUIScheme yy_modelWithDictionary:@{@"color":@"#66333333",@"font":@"14"}];
    }
    if (![dic.allKeys containsObject:@"textfiledIN"]) {
        self.textfiledIN = [QnmFormTextfiledUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"textViewIN"]) {
        self.textViewIN = [QnmFormTextViewUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"switchIN"]) {
        self.switchIN = [QnmFormSwitchUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"sliderIN"]) {
        self.sliderIN = [QnmFormSliderUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"divisionIN"]) {
        self.divisionIN = [QnmFormDivisionUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"plusReduceIN"]) {
        self.plusReduceIN = [QnmFormPlusReduceScheme yy_modelWithDictionary:@{}];
    }
    return YES;
}
// Model 转为 JSON 完成后，该方法会被调用，返回false该model会被忽略
// 同时可以在该model中做一些，转换不能实现的操作，如NSDate类型转换
//- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic;


- (CGFloat)qnm_paddingLeft {
    return [Holder(self.paddingLeft,@"12") floatValue];
}

- (CGFloat)qnm_paddingRight {
    return [Holder(self.paddingRight,@"12") floatValue];
}

- (UIColor *)qnm_color {
    return kStringColor(Holder(self.color,@"#FFFFFFFF"));
}

- (BOOL)qnm_editable {
    return [Holder(self.editable,@"1") isEqualToString:@"1"];
}
@end
