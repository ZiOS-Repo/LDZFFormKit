//
//  FormPickerCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormPickerCellModel.h"
#import "FormPickerCell.h"

@implementation FormPickerCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = kFormConfig.valColor;
        self.valFont = kFormConfig.valFont;

        //placeholder
        self.placeholder = @"请选择";
        self.placeholderColor = kFormConfig.placeholderColor;
        self.enableEdit = YES;
        self.extrImg = [kFormConfig imageFromCustomBundle:@"arrow_down"];
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
