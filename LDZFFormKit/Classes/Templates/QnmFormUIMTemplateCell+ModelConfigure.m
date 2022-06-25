//
//  QnmFormUIMTemplateCell+ModelConfigure.m
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import <objc/runtime.h>
#import <LDZFCommon/LDZFCommon.h>
static const char* holdModelKey = "holdModelKey";

@implementation QnmFormUIMTemplateCell (ModelConfigure)
@dynamic holdModel;


- (void)setHoldModel:(QnmFormItemModel *)holdModel {
    objc_setAssociatedObject(self, &holdModelKey, holdModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (QnmFormItemModel *)holdModel {
    return objc_getAssociatedObject(self, &holdModelKey);
}

- (void)configureWithModel:(QnmFormItemModel *)model {
    self.holdModel = model;
    self.contentView.backgroundColor = model.uiScheme.qnm_color;
    if (self.contentView.subviews.count == 0) {
        self.holdModel.refreshNotReusableCell = YES;
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.holdModel = nil;
}

@end
