
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSAttributedString (LabelWidthAndHeight)

/**
 *  Get the string's height with the fixed width.
 *
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)heightWithFixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @return String's width.
 */
- (CGFloat)width;

/**
 *  Get the coreText string's width.
 *
 *  @return String's width.
 */
- (CGFloat)coreTextHeightWithFixedWidth:(CGFloat)width;

@end
