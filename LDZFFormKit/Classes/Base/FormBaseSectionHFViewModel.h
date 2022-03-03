//
//  FormBaseSectionHFViewModel.h
//  CRJFormKit_Example
//
// on 2020/12/7.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormManager.h"
#import <Foundation/Foundation.h>
#import <LDZFCategories/LDZFCategories.h>
NS_ASSUME_NONNULL_BEGIN

@interface FormBaseSectionHFViewModel : NSObject
@property (nonatomic, strong) NSString *hfClass;
@property (nonatomic, strong) NSString *hfIdentifier; //组头重用标识符
@property (nonatomic, assign) CGFloat hfHeight;
@property (nonatomic, strong) id hfData;
@property (nonatomic, assign) UIEdgeInsets bodyPadding;

@property (nonatomic, strong) UIColor *backgroundColor;
@end

NS_ASSUME_NONNULL_END
