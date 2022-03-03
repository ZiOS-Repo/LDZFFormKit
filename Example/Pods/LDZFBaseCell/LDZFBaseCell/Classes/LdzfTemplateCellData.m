
#import "LdzfTemplateCellData.h"

@implementation LdzfTemplateCellData
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reuseIdentifier = @"cell";
    }
    return self;
}
@end
