//
//  FormCenterBtnCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCenterBtnCellModel.h"
#import "FormCenterBtnCell.h"

@implementation FormCenterBtnCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = kFormConfig.valColor;
        self.valFont = kFormConfig.valFont;
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
