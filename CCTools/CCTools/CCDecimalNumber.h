//
//  CCDecimalNumber.h
//  CCTools
//
//  Created by 车 on 2019/1/3.
//  Copyright © 2019 车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCDecimalNumber : NSDecimalNumber

+ (float)floatWithDecimalNumber:(double)number;

+ (double)doubleWithDecimalNumber:(double)number;

+ (NSString *)stringWithDecimalNumber:(double)number;

@end
