
#import <UIKit/UIKit.h>

@interface UIButton (Style)

/**
 *  Set the titleLabel's alignment.
 *
 *  @param horizontalAlignment UIControlContentHorizontalAlignment's value.
 *  @param verticalAlignment   UIControlContentVerticalAlignment's value.
 *  @param contentEdgeInsets   UIEdgeInsets value.
 */
- (void)titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                    verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                    contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets;

/**
 *  Set the titleLabel different state's color.
 *
 *  @param normalStateColor      Normal state color.
 *  @param highlightedStateColor Highlighted state color.
 *  @param disabledStateColor    Disabled state color.
 */
- (void)titleLabelColorWithNormalStateColor:(UIColor *)normalStateColor
                      highlightedStateColor:(UIColor *)highlightedStateColor
                         disabledStateColor:(UIColor *)disabledStateColor;

/**
 *  Set the button's ldzfd backgroundColor.
 *
 *  @param normalStateColor      Normal state color.
 *  @param highlightedStateColor Highlighted state color.
 *  @param disabledStateColor    Disabled state color.
 */
- (void)buttonSolidBackgroundColorWithNormalStateColor:(UIColor *)normalStateColor
                                 highlightedStateColor:(UIColor *)highlightedStateColor
                                    disabledStateColor:(UIColor *)disabledStateColor;

/**
 *  Create Label button.
 *
 *  @param frame                 Frame.
 *  @param title                 Title.
 *  @param font                  Font.
 *  @param horizontalAlignment   HorizontalAlignment.
 *  @param verticalAlignment     VerticalAlignment.
 *  @param contentEdgeInsets     ContentEdgeInsets.
 *  @param target                Target.
 *  @param action                Action.
 *  @param normalStateColor      NormalStateColor.
 *  @param highlightedStateColor HighlightedStateColor.
 *  @param disabledStateColor    DisabledStateColor.
 *
 *  @return Label button.
 */
+ (UIButton *)labelButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                              font:(UIFont *)font
               horizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                 verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                 contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                            target:(id)target
                            action:(SEL)action
                  normalTitleColor:(UIColor *)normalStateColor
             highlightedTitleColor:(UIColor *)highlightedStateColor
                disabledTitleColor:(UIColor *)disabledStateColor;

/**
 *  Create icon button.
 *
 *  @param frame               Frame.
 *  @param horizontalAlignment HorizontalAlignment.
 *  @param verticalAlignment   VerticalAlignment.
 *  @param contentEdgeInsets   ContentEdgeInsets
 *  @param target              Target.
 *  @param action              Action.
 *  @param normalImage         NormalImage.
 *  @param highlightImage      HighlightImage.
 *  @param disabledImage       DisabledImage.
 *
 *  @return button.
 */
+ (UIButton *)iconButtonWithFrame:(CGRect)frame
              horizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                           target:(id)target
                           action:(SEL)action
                      normalImage:(UIImage *)normalImage
                   highlightImage:(UIImage *)highlightImage
                    disabledImage:(UIImage *)disabledImage;

#pragma mark - CustomIcon.
/** 图片在左，标题在右 */
- (void)setIconInLeft;
/** 图片在右，标题在左 */
- (void)setIconInRight;
/** 图片在上，标题在下 */
- (void)setIconInTop;
/** 图片在下，标题在上 */
- (void)setIconInBottom;

//** 可以自定义图片和标题间的间隔 */
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;

@end
