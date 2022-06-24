//
//  QnmSliderInfoBean.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import <Foundation/Foundation.h>
#import <LDZFCommon/LDZFCommon.h>
NS_ASSUME_NONNULL_BEGIN

@interface QnmSliderInfoBean : NSObject
@property(nonatomic) float value;
@property(nonatomic) float minimumValue;
@property(nonatomic) float maximumValue;
// minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
@property(nonatomic,copy) NSString *minimumTrackTintColor;
// maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
@property(nonatomic,copy) NSString *maximumTrackTintColor;
// thumbTintColor : 当前滑块的颜色，默认为白色
@property(nonatomic,copy) NSString *thumbTintColor;

@end

NS_ASSUME_NONNULL_END
