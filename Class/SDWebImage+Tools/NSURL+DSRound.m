//
//  NSURL+DSRound.m
//  DSRoundedImage
//
//  Created by dasheng on 16/9/29.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "NSURL+DSRound.h"
#import <objc/runtime.h>

const void * kDSRoundKey = &kDSRoundKey;

@implementation NSURL (DSRound)

#pragma mark - associated properties

-(void)setKeyOfDSRound:(NSString*)key{
    objc_setAssociatedObject(self, &kDSRoundKey,key, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*)keyOfDSRound{
    return objc_getAssociatedObject(self, &kDSRoundKey);
}

@end
