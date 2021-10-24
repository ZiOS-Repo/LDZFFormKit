//
//  TntBaseHeaderFooterView.h
//  CRJFormKit_Example
//
// on 2020/12/7.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "IUFormKitMacos.h"
#import "UIView+Tnt.h"
#import "Masonry/Masonry.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TntBaseHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) id data;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *controller;
#pragma mark - Method you should overwrite.

- (void)setupCell;

- (void)buildSubview;

- (void)loadContent;

+ (CGFloat)cellHeightWithData:(id)data;

/**
*  Used for delegate event.
*/
- (void)delegateEvent;
@end

NS_ASSUME_NONNULL_END
