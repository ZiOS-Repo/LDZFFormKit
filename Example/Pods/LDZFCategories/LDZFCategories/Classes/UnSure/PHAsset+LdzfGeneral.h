//
//  PHAsset+LdzfGeneral.h
//  IU_Categories
//
//  Created by zhuyuhui on 2021/7/3.
//

#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHAsset (LdzfGeneral)
/**
 *  获取最新一张图片
 */
+ (PHAsset *)ldzf_latestAsset;

+ (UIImage *)ldzf_latestOriginImage;

+ (void)ldzf_latestImageWithSize:(CGSize)size completeBlock:(void(^)(UIImage *image))block;

@end

NS_ASSUME_NONNULL_END
