//
//  FormPlusReduceCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormPlusReduceCellModel.h"
#import "FormPlusReduceCell.h"

@implementation FormPlusReduceCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reduceEnable = YES;
        self.plusEnable = YES;
        self.inputBoxEnableEdit = YES;
        self.inputBoxWidth = 50;
        
        self.reduceImg_normal = [kFormConfig imageFromCustomBundle:@"item_decrease"];
        self.reduceImg_disabled = [kFormConfig imageFromCustomBundle:@"item_decrease_disable"];
        self.plusImg_normal = [kFormConfig imageFromCustomBundle:@"item_increase"];
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
