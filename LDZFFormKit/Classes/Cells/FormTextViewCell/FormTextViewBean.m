//
//  FormTextViewBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormTextViewBean.h"
#import "FormTextViewCell.h"

@implementation FormTextViewBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = FormManager.shared.valColor;
        self.valFont = FormManager.shared.valFont;

        //placeholder
        self.placeholder = @"请输入";
        self.placeholderColor = FormManager.shared.placeholderColor;
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
