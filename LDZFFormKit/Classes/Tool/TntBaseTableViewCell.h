//
//  TntBaseTableViewCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import <UIKit/UIKit.h>
#import "Masonry/Masonry.h"
#import "UIView+Tnt.h"
#import "IUFormKitMacos.h"
NS_ASSUME_NONNULL_BEGIN

@interface TntBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) id data;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *controller;
#pragma mark - Method you should overwrite.

- (void)setupCell;

- (void)buildSubview;

- (void)loadContent;

+ (CGFloat)cellHeightWithData:(id)data;

#pragma mark - Useful method.

/**
 *  Used for delegate event.
 */
- (void)delegateEvent;

@end

NS_ASSUME_NONNULL_END
