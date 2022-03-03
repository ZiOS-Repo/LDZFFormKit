//
//  FormBtnsBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBtnsBean.h"
#import "FormBtnsCell.h"

@implementation FormBtnsBean

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.btn_normal_color = [UIColor blackColor];
        self.btn_select_color = [UIColor redColor];
        self.valFont = FormManager.shared.valFont;
        
        self.btn_size = CGSizeMake(64, 30);
        self.btn_cornerRadius = 4;
        self.btn_borderWidth = 1;

    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormBtnsCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormBtnsCell.class);
}
@end
