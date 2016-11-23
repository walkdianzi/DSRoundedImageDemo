//
//  UIImage+DSRoundImage.h
//  DSRoundedImage
//
//  Created by dasheng on 16/9/29.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSString *kDSRoundImagePreString = @"DSRoundImagePreString";

@interface UIImage (DSRoundImage)

+ (NSString *)ds_imageUrlForKey:(NSString*)key;

+ (id)ds_createRoundedRectImage:(UIImage*)image withKey:(NSString *)key;

@end
