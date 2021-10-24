//
//  FormKVCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormKVCellModel.h"
#import "FormKVCell.h"
@implementation FormKVCellModel
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
    return NSStringFromClass(FormKVCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormKVCell.class);
}
@end
