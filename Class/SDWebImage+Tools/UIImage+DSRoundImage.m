//
//  UIImage+DSRoundImage.m
//  DSRoundedImage
//
//  Created by dasheng on 16/9/29.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "UIImage+DSRoundImage.h"

@implementation UIImage (DSRoundImage)

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    
    if (ovalWidth == 0 || ovalHeight == 0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

+ (NSString *)ds_imageUrlForKey:(NSString*)key{
    NSArray *preArray = [key componentsSeparatedByString:[NSString stringWithFormat:@"%@",kDSRoundImagePreString]];
    
    return [preArray lastObject];
}

+ (id)ds_createRoundedRectImage:(UIImage*)image withKey:(NSString *)key{
    //判断是否绘制圆角
    if (key && [key hasPrefix:[NSString stringWithFormat:@"%@",kDSRoundImagePreString]]) {
        
        NSArray *preArray = [key componentsSeparatedByString:[NSString stringWithFormat:@"%@",kDSRoundImagePreString]];
        CGSize imageSize;
        
        if ([preArray count]>2) {
            float width = image.size.width;
            float height = image.size.height;
            if (width > 0 && height > 0) {
                if (width>height) {
                    imageSize = CGSizeMake(width, width);
                }else{
                    imageSize = CGSizeMake(height, height);
                }
            }
        }else{
            
            if (image.size.height > image.size.width) {
                imageSize = CGSizeMake(image.size.height, image.size.height);
            }else{
                imageSize = CGSizeMake(image.size.width, image.size.width);
            }
        }
        
        int w = imageSize.width;
        int h = imageSize.height;
        float radiusScale = [[preArray objectAtIndex:1] floatValue];
        
        int radius = imageSize.width * radiusScale;
        
        UIImage *img = image;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
        CGRect rect = CGRectMake(0, 0, w, h);
        
        CGContextBeginPath(context);
        
        addRoundedRectToPath(context, rect, radius, radius);
        CGContextClosePath(context);
        CGContextClip(context);
        CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
        CGImageRef imageMasked = CGBitmapContextCreateImage(context);
        img = [UIImage imageWithCGImage:imageMasked];
        
        CGContextRelease(context);
        CGColorSpaceRelease(colorSpace);
        CGImageRelease(imageMasked);
        
        return img;
    }else{
        return image;
    }
}

@end
