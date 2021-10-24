//
//  FormTextfiledCellModel.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormTextfiledCellModel.h"
#import "FormTextfiledCell.h"

@implementation FormTextfiledCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        //value
        self.valColor = kFormConfig.valColor;
        self.valFont = kFormConfig.valFont;

        //placeholder
        self.placeholder = @"请输入";
        self.placeholderColor = kFormConfig.placeholderColor;
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
