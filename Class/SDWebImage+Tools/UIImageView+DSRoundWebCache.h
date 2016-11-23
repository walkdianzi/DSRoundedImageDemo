//
//  UIImageView+DSRoundWebCache.h
//  DSRoundedImage
//
//  Created by dasheng on 16/9/29.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (DSRoundWebCache)

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radiusScale:(CGFloat)radiusScale;

@end
