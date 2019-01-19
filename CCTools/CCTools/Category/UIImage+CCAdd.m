//
//  UIImage+CCAdd.m
//  CCTools
//
//  Created by 车 on 2019/1/19.
//  Copyright © 2019 车. All rights reserved.
//

#import "UIImage+CCAdd.h"

@implementation UIImage (CCAdd)

- (NSData *)compressToJPEGFormatDataWithFactor:(CGFloat)factor maxFielSize:(u_int64_t)fileSize {
    if (!self) {
        return nil;
    }
    // 如果原图片大小满足要求
    NSData *tempImageData = UIImageJPEGRepresentation(self, 1.0);
    if ([tempImageData length] <= fileSize) {
        return tempImageData;
    }
    
    // 不满足要求 开始用二分法计算最优压缩精度
    
    NSData *targetImageData = nil;
    
    /*
     由于compressionFactor为浮点值，设置查找出口时，若简单判断查找区间下界和上界
     差值(maxFactor-minFactor > 0)，下界恒小于上界，将陷入死循环。因而，我们可
     以选择设定查找区间下界和上界的差值精度(maxFactor-minFactor > factor)以避免
     这种情况。
     */
    CGFloat compressionFactor = factor;
    CGFloat minFactor = 0;
    CGFloat maxFactor = 1.0f;
    CGFloat midFactor = 0;
    
    // fabs获取绝对值函数
    while (fabs(maxFactor - minFactor) > compressionFactor) {
        // @autoreleasepool作用: 每次循环后局部变量立即释放 (防止内存过高)
        @autoreleasepool
        {
            midFactor = minFactor + (maxFactor - minFactor) / 2;
            tempImageData = UIImageJPEGRepresentation(self, midFactor);
            if ([tempImageData length] > fileSize) {
                maxFactor = midFactor;
            } else {
                minFactor = midFactor;
                targetImageData = tempImageData;
            }
        }
    }
    return targetImageData;
}
@end
