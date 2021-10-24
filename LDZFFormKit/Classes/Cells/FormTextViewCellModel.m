//
//  FormTextViewCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormTextViewCellModel.h"
#import "FormTextViewCell.h"

@implementation FormTextViewCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = kFormConfig.valColor;
        self.valFont = kFormConfig.valFont;

        //placeholder
        self.placeholder = @"请输入";
        self.placeholderColor = kFormConfig.placeholderColor;
        self.enableEdit = YES;
        self.bodyHeight = 158;
    }
    return self;
}
- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormTextViewCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormTextViewCell.class);
}
@end
