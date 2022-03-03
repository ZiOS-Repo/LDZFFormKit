//
//  LdzfTemplateGridCell.h
//  CRJUIComponents
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>
#import "LdzfTemplateCellData.h"
@class LdzfTemplateGridCell;

@protocol LdzfTemplateGridCellDelegate <NSObject>
@optional
/**
 *  LdzfTemplateGridCell's event.
 *
 *  @param cell  LdzfTemplateGridCell
 *  @param event Event.
 */
- (void)LdzfTemplateGridCell:(LdzfTemplateGridCell *)cell event:(id)event;

@end
@interface LdzfTemplateGridCell : UICollectionViewCell

/**
 *  LdzfTemplateGridCell's delegate.
 */
@property (nonatomic, weak) id <LdzfTemplateGridCellDelegate> delegate;

/**
 *  LdzfTemplateGridCell's data.
 */
@property (nonatomic, strong) LdzfTemplateCellData *dataAdapter;

/**
 *  LdzfTemplateGridCell's data.
 */
@property (nonatomic, strong) id data;

/**
 *  LdzfTemplateGridCell's indexPath.
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  TableView.
 */
@property (nonatomic, weak) UICollectionView *collectionView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *  Cell is showed or not, you can set this property in UICollectionView's method 'collectionView:willDisplayCell:forItemAtIndexPath:' at runtime.
 */
@property (nonatomic) BOOL display;

#pragma mark - Method you should overwrite.

/**
 *  Setup cell, override by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, override by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, override by subclass.
 */
- (void)loadContent;

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
 *  Selected event, override by subclass.
 */
- (void)selectedEvent;

/**
 *  Register to collectionView with the reuseIdentifier you specified.
 *
 *  @param collectionView  CollectionView.
 *  @param reuseIdentifier The cell reuseIdentifier.
 */
+ (void)registerToCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)reuseIdentifier;

/**
 *  Register to collectionView with the The class name.
 *
 *  @param collectionView  collectionView.
 */
+ (void)registerToCollectionView:(UICollectionView *)collectionView;


@end

