//
//  FormBaseSection.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseSection.h"

@implementation FormBaseSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        //组头
        self.headerInfo = [[FormBaseSectionHFViewModel alloc] init];
        //组尾
        self.footerInfo = [[FormBaseSectionHFViewModel alloc] init];
        
        self.cellDatas = [NSMutableArray array];
    }
    return self;
}

- (UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithtableView:(UITableView *)tableView {
    UITableViewHeaderFooterView *hfView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerInfo.hfIdentifier];
    if (!hfView) {
        [tableView registerClass:NSClassFromString(self.headerInfo.hfClass) forHeaderFooterViewReuseIdentifier:self.headerInfo.hfIdentifier];
        hfView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerInfo.hfIdentifier];
    }
    return hfView;
}
@end
