//
//  FormPlusReduceBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormPlusReduceBean.h"
#import "FormPlusReduceCell.h"

@implementation FormPlusReduceBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reduceEnable = YES;
        self.plusEnable = YES;
        self.inputBoxEnableEdit = YES;
        self.inputBoxWidth = 50;

        self.reduceImg_normal = [FormManager imageName:@"item_decrease"];
        self.reduceImg_disabled = [FormManager imageName:@"item_decrease_disable"];
        self.plusImg_normal = [FormManager imageName:@"item_increase"];
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormPlusReduceCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormPlusReduceCell.class);
}
@end
