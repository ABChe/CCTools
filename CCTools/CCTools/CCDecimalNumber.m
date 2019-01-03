//
//  CCDecimalNumber.m
//  CCTools
//
//  Created by 车 on 2019/1/3.
//  Copyright © 2019 车. All rights reserved.
//

#import "CCDecimalNumber.h"

@implementation CCDecimalNumber

+ (float)floatWithDecimalNumber:(double)number {
    return [[self decimalNumber:number] floatValue];
}

+ (double)doubleWithDecimalNumber:(double)number {
    return [[self decimalNumber:number] doubleValue];
}

+ (NSString *)stringWithDecimalNumber:(double)number {
    return [[self decimalNumber:number] stringValue];
}

+ (NSDecimalNumber *)decimalNumber:(double)number {
    NSString *string = [NSString stringWithFormat:@"%lf", number];
    return [NSDecimalNumber decimalNumberWithString:string];
}

@end
