//
//  FormPlusReduceBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonBean.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormPlusReduceBean : FormCommonBean
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, assign) BOOL reduceEnable;
@property (nonatomic, assign) BOOL plusEnable;
@property (nonatomic, assign) BOOL inputBoxEnableEdit; //是否可编辑
@property (nonatomic, assign) CGFloat inputBoxWidth;

///
@property(nonatomic, strong) UIImage *reduceImg_normal;
@property(nonatomic, strong) UIImage *reduceImg_disabled;
@property(nonatomic, strong) UIImage *plusImg_normal;

@end

NS_ASSUME_NONNULL_END
