//
//  FormPickerBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormPickerBean.h"
#import "FormPickerCell.h"

@implementation FormPickerBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = FormManager.shared.valColor;
        self.valFont = FormManager.shared.valFont;

        //placeholder
        self.placeholder = @"请选择";
        self.placeholderColor = FormManager.shared.placeholderColor;
        self.enableEdit = YES;
        self.extrImg = [FormManager imageName:@"arrow_down"];
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormPickerCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormPickerCell.class);
}
@end
