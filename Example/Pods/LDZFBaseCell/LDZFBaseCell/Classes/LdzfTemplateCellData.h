

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LdzfTemplateCellData : NSObject
/// 重用标识符
@property(nonatomic, copy) NSString *reuseIdentifier;

/// 数据
@property(nonatomic, strong) id data;

/// cell高度
@property(nonatomic, assign) CGFloat height;

/// cell宽度
@property(nonatomic, assign) CGFloat width;

/// cell类型
@property(nonatomic, assign) NSInteger type;

@end

NS_ASSUME_NONNULL_END
