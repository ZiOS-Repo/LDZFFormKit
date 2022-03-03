
#import <UIKit/UIKit.h>
#import "LdzfTemplateCellData.h"
@class LdzfTemplateCell;

@protocol LdzfTemplateCellDelegate <NSObject>

@optional

/**
 *  LdzfTemplateCell's event.
 *
 *  @param cell  LdzfTemplateCell type class.
 *  @param event Event data.
 */
- (void)LdzfTemplateCell:(LdzfTemplateCell *)cell event:(id)event;

@end
@interface LdzfTemplateCell : UITableViewCell
#pragma mark - Propeties.

/**
 *  LdzfTemplateCell's delegate.
 */
@property (nonatomic, weak) id <LdzfTemplateCellDelegate> delegate;

/**
 *  LdzfTemplateCell's dataAdapter.
 */
@property (nonatomic, strong) LdzfTemplateCellData *dataAdapter;

/**
 *  LdzfTemplateCell's data.
 */
@property (nonatomic, strong) id data;

/**
 *  LdzfTemplateCell's indexPath.
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  TableView.
 */
@property (nonatomic, weak) UITableView *tableView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *  Cell is showed or not, you can set this property in UITableView's method 'tableView:willDisplayCell:forRowAtIndexPath:' & 'tableView:didEndDisplayingCell:forRowAtIndexPath:' at runtime.
 */
@property (nonatomic) BOOL display;

#pragma mark - Method you should overwrite.

/**
 *  Setup cell, overwrite by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, overwrite by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, overwrite by subclass.
 */
- (void)loadContent;

/**
 *  Calculate the cell's height from data, overwrite by subclass.
 *
 *  @param data Data.
 *
 *  @return Cell's height.
 */
+ (CGFloat)cellHeightWithData:(id)data;


#pragma mark - Display.
/**
 *  Will display.
 */
- (void)willDisplay;

/**
 *  Did end display.
 */
- (void)didEndDisplay;

/**
 The contentOffset, you can use this value to do sth.

 @param offset The offset.
 */
- (void)contentOffset:(CGPoint)offset;



#pragma mark - Useful method.

/**
 *  Update the cell's height with animated or not, before you use this method, you should have the weak reference 'tableView' and 'dataAdapter', and this method will update the weak reference dataAdapter's property cellHeight.
 *
 *  @param height   The new cell height.
 *  @param animated Animated or not.
 */
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated;

/**
 *  Selected event, you should use this method in 'tableView:didSelectRowAtIndexPath:' to make it effective.
 */
- (void)selectedEvent;

/**
 *  Used for delegate event.
 */
- (void)delegateEvent;

/**
 *  Register to tableView with the reuseIdentifier you specified.
 *
 *  @param tableView       TableView.
 *  @param reuseIdentifier The cell reuseIdentifier.
 */
+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

/**
 *  Register to tableView with the The class name.
 *
 *  @param tableView       TableView.
 */
+ (void)registerToTableView:(UITableView *)tableView;
@end

