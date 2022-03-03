//
//  FormCommonBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonBean.h"
#import "FormCommonCell.h"

@implementation FormCommonBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        //key
        self.keyColor = FormManager.shared.keyColor;
        self.keyFont = FormManager.shared.keyFont;
        self.keyMaxWidth = FormManager.shared.keyMaxWidth;
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormCommonCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormCommonCell.class);
}
@end
