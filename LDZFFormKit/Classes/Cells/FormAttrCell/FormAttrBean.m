//
//  FormAttrBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormAttrBean.h"
#import "FormAttrCell.h"

@implementation FormAttrBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.safeTop = 10;
        self.safeBottom = 10;
    }
    return self;
}

- (void)setVal:(NSAttributedString *)val {
    _val = val;
    [self calculateAttrHeight];
}

- (void)calculateAttrHeight {
    UILabel *_keyLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.cellWidth - self.bodyPadding.left - self.bodyPadding.right, 0)];
    _keyLable.numberOfLines = 0;
    _keyLable.attributedText = self.val;
    [_keyLable sizeToFit];
    self.bodyHeight = _keyLable.height + self.safeTop + self.safeBottom;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormAttrCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormAttrCell.class);
}

@end
