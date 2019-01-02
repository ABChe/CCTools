//
//  CCKeychainStore.h
//  CCTools
//
//  Created by 车 on 2018/12/6.
//  Copyright © 2018 车. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const CCKeychainStoreInsteadUUIDKey;

@interface CCKeychainStore : NSObject

/**
 将 UUID 存入 keychain 来实现设备唯一标识符的效果
 @return 设备ID
 */
+ (NSString *)getDeviceID;

/**
 删除设备ID

 @param insteadUUIDKey CCKeychainStoreInsteadUUIDKey
 */
+ (void)deleteDeviceID:(NSString *)insteadUUIDKey;

@end
