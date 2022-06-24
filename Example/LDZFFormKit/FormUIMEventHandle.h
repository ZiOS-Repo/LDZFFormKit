//
//  FormUIMEventHandle.h
//  LDZFFormKit_Example
//
//  Created by zhuyuhui on 2022/6/24.
//  Copyright © 2022 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LDZFFormKit/QnmFormUIManagementHeader.h>
NS_ASSUME_NONNULL_BEGIN

@interface FormUIMEventHandle : NSObject<QnmFormUIMEventProtocol>
@property(nonatomic, weak) id <QnmFormUIMEventProtocol>eventHandlerDelegate;
@end

NS_ASSUME_NONNULL_END
