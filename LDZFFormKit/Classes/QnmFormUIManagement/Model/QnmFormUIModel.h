//
//  QnmFormUIModel.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import "QnmFormItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QnmFormUIModel : NSObject

@property (nonatomic, copy) NSArray <QnmFormItemModel *> *modules;

@end

NS_ASSUME_NONNULL_END
