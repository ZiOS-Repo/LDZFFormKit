//
//  FormSliderCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class FormSliderCell,FormSliderBean;

@protocol FormSliderCellDelegate <NSObject>

@optional
///值改变
- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean sliderValueDidChanged:(UISlider *)sender;
///停止滑动
- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean sliderEnd:(UISlider *)sender;
///展开或关闭
- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean clickAreaBtn:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
