//
//  FormUIMAdapter.m
//  LDZFFormKit_Example
//
//  Created by zhuyuhui on 2022/6/23.
//  Copyright © 2022 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormUIMAdapter.h"

@implementation FormUIMAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0.f;
    if (indexPath.row >= self.modelTopOffset && indexPath.row < self.baseModules.modules.count + self.modelTopOffset) {
        height = [self srstableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return height;
}
@end
