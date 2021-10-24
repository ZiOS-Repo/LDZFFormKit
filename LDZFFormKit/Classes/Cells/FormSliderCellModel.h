//
//  FormSliderCellModel.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormSliderCellModel : FormCommonCellModel
@property(nonatomic) float value;
@property(nonatomic) float minimumValue;
@property(nonatomic) float maximumValue;
@property(nonatomic) BOOL expend;//当前展开状态
@property(nonatomic) CGFloat defaultHeight;//默认高度
@property(nonatomic) CGFloat expendHeight;//延展高度

// minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
@property(nonatomic,strong) UIColor *minimumTrackTintColor;
// maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
@property(nonatomic,strong) UIColor *maximumTrackTintColor;
// thumbTintColor : 当前滑块的颜色，默认为白色
@property(nonatomic,strong) UIColor *thumbTintColor;

@end

NS_ASSUME_NONNULL_END
