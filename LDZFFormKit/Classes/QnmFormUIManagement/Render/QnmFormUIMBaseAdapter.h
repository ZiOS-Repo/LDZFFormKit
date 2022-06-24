//
//  QnmFormUIMBaseAdapter.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import "QnmFormUIMEventProtocol.h"
#import "QnmFormUIModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QnmFormUIMBaseAdapter : NSObject<UITableViewDataSource, QnmFormUIMDataOffsetProtocol, UIScrollViewDelegate>

@property (nonatomic, weak) id <QnmFormUIMEventProtocol> eventDelegate;
@property (nonatomic, strong, readonly) QnmFormUIModel *baseModules;

- (instancetype)init;
- (instancetype)initWithManagerClass:(Class)className;
- (void)setDataModel:(nullable QnmFormUIModel *)model forTableView:(UITableView *)tableView;
- (CGFloat)srstableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
