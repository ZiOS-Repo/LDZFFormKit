//
//  FormCommonCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCellModel.h"
#import "FormCommonCell.h"

@implementation FormCommonCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        //key
        self.keyColor = kFormConfig.keyColor;
        self.keyFont = kFormConfig.keyFont;
        self.keyMaxWidth = kFormConfig.keyMaxWidth;
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
