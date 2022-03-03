//
//  LdzfListCollectionView.h
//  LDZFMobileFramework
//
//  Created by zhuyuhui on 2022/2/11.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>

NS_ASSUME_NONNULL_BEGIN

@interface LdzfListCollectionView : UIView<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong, nullable) UICollectionView *recylerView;

- (void)ldzfInitSubviews;
// 创建table view
- (void)createTableView;
- (void)createTableViewWithFrame:(CGRect)frame
            collectionViewLayout:(UICollectionViewLayout *)layout;
- (void)createTableView:(Class)viewClass
              withFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout*)layout;
// 默认全为YES
@property (nonatomic, assign) BOOL enableHeaderRefresh;
@property (nonatomic, assign) BOOL enableFooterRefresh;
@property (nonatomic, assign) BOOL enableRefresh;

// 刷新时执行的方法
- (void)footerRefreshAction;
- (void)headerRefreshAction;
// 开始刷新
- (void)startRefresh;
// 停止刷新
- (void)stopRefresh;
// 是否正在刷新，返回YES时表示有头部或底部正在刷新
- (BOOL)isRefreshing;


@end

NS_ASSUME_NONNULL_END
