//
//  LdzfUIHelper.h
//  LDZFCommon
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LdzfUIHelper : NSObject

@end

@interface LdzfUIHelper (UIColor)
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithColorString:(NSString *)colorString;
+ (UIColor *)randomColor;
@end


NS_ASSUME_NONNULL_END
