//
//  FormBaseSection.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import <Foundation/Foundation.h>
#import "FormBaseSectionHFViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FormBaseSection : NSObject
@property (nonatomic, assign) NSInteger type;
//组头
@property(nonatomic, strong) FormBaseSectionHFViewModel *headerInfo;
//组尾
@property(nonatomic, strong) FormBaseSectionHFViewModel *footerInfo;
//数据
@property (nonatomic, strong) NSMutableArray *cellDatas;

- (UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithtableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
