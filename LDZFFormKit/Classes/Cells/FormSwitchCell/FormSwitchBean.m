//
//  FormSwitchBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormSwitchBean.h"
#import "FormSwitchCell.h"

@implementation FormSwitchBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.enable = YES;
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormSwitchCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormSwitchCell.class);
}
@end
