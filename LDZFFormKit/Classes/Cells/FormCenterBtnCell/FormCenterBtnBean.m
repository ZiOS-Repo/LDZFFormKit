//
//  FormCenterBtnBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCenterBtnBean.h"
#import "FormCenterBtnCell.h"

@implementation FormCenterBtnBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = FormManager.shared.valColor;
        self.valFont = FormManager.shared.valFont;
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormCenterBtnCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormCenterBtnCell.class);
}
@end
