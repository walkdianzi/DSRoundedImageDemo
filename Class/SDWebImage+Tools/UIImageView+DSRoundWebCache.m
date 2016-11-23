//
//  UIImageView+DSRoundWebCache.m
//  DSRoundedImage
//
//  Created by dasheng on 16/9/29.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "UIImageView+DSRoundWebCache.h"
#import "NSURL+DSRound.h"
#import "UIImage+DSRoundImage.h"

@implementation UIImageView (DSRoundWebCache)

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radiusScale:(CGFloat)radiusScale{

    NSString *keyOfSWORound = [NSString stringWithFormat:@"%@%f%@%@",
                               kDSRoundImagePreString,
                               radiusScale,
                               kDSRoundImagePreString,
                               [url absoluteString]];
    
    url.keyOfDSRound = keyOfSWORound;
    
    [self sd_setImageWithURL:url];
    
    //!!! 忽略解码
    //[self sd_setImageWithURL:url placeholderImage:nil options:SDWebImageDrawSWORoundImageInMemoryCache];
}

@end
