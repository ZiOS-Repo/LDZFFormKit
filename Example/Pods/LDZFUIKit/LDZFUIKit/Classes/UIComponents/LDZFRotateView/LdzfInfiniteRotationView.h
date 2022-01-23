//
//  LdzfInfiniteRotationView.h
//  Pods
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>

@interface LdzfInfiniteRotationView : UIView

/**
 *  How many seconds to rotate 1 π (s/π).
 */
@property (nonatomic) NSTimeInterval  speed;

/**
 *  Direction of rotation, default is YES.
 */
@property (nonatomic) BOOL    clockWise;

/**
 *  Start angle.
 */
@property (nonatomic) CGFloat startAngle;

/**
 *  Start rotate animation.
 */
- (void)startRotateAnimation;

/**
 *  Stop and reset animation.
 */
- (void)reset;
@end
