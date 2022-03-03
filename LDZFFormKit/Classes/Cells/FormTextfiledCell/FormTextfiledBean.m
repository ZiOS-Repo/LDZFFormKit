//
//  FormTextfiledBean.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormTextfiledBean.h"
#import "FormTextfiledCell.h"

@implementation FormTextfiledBean
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = FormManager.shared.valColor;
        self.valFont = FormManager.shared.valFont;

        //placeholder
        self.placeholder = @"请输入";
        self.placeholderColor = FormManager.shared.placeholderColor;
        self.enableEdit = YES;
    }
    return self;
}

- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormTextfiledCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormTextfiledCell.class);
}
@end
