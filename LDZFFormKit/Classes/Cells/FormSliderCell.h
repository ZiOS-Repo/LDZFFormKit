//
//  FormSliderCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCell.h"
#import "FormSliderCellModel.h"
NS_ASSUME_NONNULL_BEGIN
@class FormSliderCell;

@protocol FormSliderCellDelegate <NSObject>

@optional
///值改变
- (void)sliderCell:(FormSliderCell *)cell sliderValueDidChanged:(UISlider *)sender;
///停止滑动
- (void)sliderCell:(FormSliderCell *)cell sliderEnd:(UISlider *)sender;
///展开或关闭
- (void)sliderCell:(FormSliderCell *)cell clickAreaBtn:(UIButton *)sender;

@end
@interface FormSliderCell : FormBaseCell
@property (nonatomic, weak) id<FormSliderCellDelegate> sliderCellDelegate;
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) UIImageView *arrowImg;
@property(nonatomic, strong) UISlider *valSlider;

@end

NS_ASSUME_NONNULL_END
