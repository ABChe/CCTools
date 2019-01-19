//
//  UIImage+CCAdd.h
//  CCTools
//
//  Created by 车 on 2019/1/19.
//  Copyright © 2019 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CCAdd)


/**
 指定文件大小的压缩方法

 @param factor 期望最小精度差值(0 ~ 1) 推荐0.01-0.1
 @param fileSize 期望文件大小
 @return JPEG格式的图片数据
 */
- (NSData *)compressToJPEGFormatDataWithFactor:(CGFloat)factor maxFielSize:(u_int64_t)fileSize;

@end
