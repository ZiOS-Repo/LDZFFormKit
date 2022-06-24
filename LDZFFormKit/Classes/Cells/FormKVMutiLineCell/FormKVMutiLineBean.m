//
//  FormKVMutiLineBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormKVMutiLineBean.h"
#import "FormKVMutiLineCell.h"

@implementation FormKVMutiLineBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.safeTop = 12;
        self.safeBottom = 12;
        self.hGap = 10;
        self.keyMaxWidth = FormManager.shared.keyMaxWidth;
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormKVMutiLineCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormKVMutiLineCell.class);
}


- (void)updateBodyHeight {
    CGFloat attrKeyH = 0;
    CGFloat attrValueH = 0;
    UILabel *lable = [[UILabel alloc] init];
    lable.numberOfLines = 0;
    
    if (self.key && !isStringEmptyOrNil(self.key.string)) {
        lable.width = self.keyMaxWidth;
        lable.attributedText = self.key;
        [lable sizeToFit];
        attrKeyH = lable.height;
    }
    
    if (self.val && !isStringEmptyOrNil(self.val.string)) {
        lable.width = self.cellWidth - self.bodyPadding.left - self.bodyPadding.right - self.keyMaxWidth - self.hGap;
        lable.attributedText = self.val;
        [lable sizeToFit];
        attrValueH = lable.height;
    }
    CGFloat contenH = MAX(attrKeyH, attrValueH);
    self.bodyHeight = self.safeTop + self.safeBottom + contenH;
}



#pragma mark - Useful Method
+ (NSAttributedString *)attrByText:(NSString *)text font:(UIFont *)font color:(UIColor *)color{
    NSAttributedString *attrStr = [self attrByText:text attributesHandle:^(NSMutableDictionary<NSAttributedStringKey,id> *attributes) {
        [attributes setValue:font forKey:NSFontAttributeName];
        [attributes setValue:color forKey:NSForegroundColorAttributeName];
    }];
    return attrStr;
}

+ (NSAttributedString *)attrByText:(NSString *)text
                  attributesHandle:(void (^)(NSMutableDictionary<NSAttributedStringKey, id> *attributes))attributesHandle
{
    NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionary];
    if (attributesHandle) {
        attributesHandle(attributes);
    }
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:text?:@"" attributes:attributes];
    return attrStr;
}
@end
