//
//  FormBaseSectionHFViewModel.m
//  CRJFormKit_Example
//
// on 2020/12/7.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormBaseSectionHFViewModel.h"
#import "IUFormKitMacos.h"
@implementation FormBaseSectionHFViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hfHeight = 0.1;
        self.bodyPadding = kFormConfig.bodyPadding;
        self.backgroundColor = FORM_COLOR_WITH_HEX(0xF7F7F7);
    }
    return self;
}
@end
