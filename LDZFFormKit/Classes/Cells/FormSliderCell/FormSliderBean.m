//
//  FormSliderBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormSliderBean.h"
#import "FormSliderCell.h"

@implementation FormSliderBean

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumValue = 0;
        self.maximumValue = 100;
        self.defaultHeight = 48;
        self.expendHeight = 50;
        self.expend = NO;        
    }
    return self;
}

- (void)setExpend:(BOOL)expend {
    _expend = expend;
    if (expend) {
        self.bodyHeight = self.defaultHeight + self.expendHeight;
    } else {
        self.bodyHeight = self.defaultHeight;
    }
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormSliderCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormSliderCell.class);
}
@end
