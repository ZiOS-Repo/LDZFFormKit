//
//  FormKVBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormKVBean.h"
#import "FormKVCell.h"
@implementation FormKVBean
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
    return NSStringFromClass(FormKVCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormKVCell.class);
}
@end
