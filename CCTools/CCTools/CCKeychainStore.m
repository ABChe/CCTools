//
//  CCKeychainStore.m
//  CCTools
//
//  Created by 车 on 2018/12/6.
//  Copyright © 2018 车. All rights reserved.
//

#import "CCKeychainStore.h"
#import <Security/Security.h>

NSString *const CCKeychainStoreInsteadUUIDKey = @"com.cctools.test";

@implementation CCKeychainStore

+ (NSString *)getDeviceID {
    NSString *getUDIDInKeychain = (NSString *)[CCKeychainStore load:CCKeychainStoreInsteadUUIDKey];
    NSLog(@"\n \n -------   CCKeychainStore获取到的UUID: %@  ------- \n",getUDIDInKeychain);
    if (!getUDIDInKeychain ||[getUDIDInKeychain isEqualToString:@""]||[getUDIDInKeychain isKindOfClass:[NSNull class]]) {
        CFUUIDRef puuid = CFUUIDCreate( nil );
        CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
        NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
        CFRelease(puuid);
        CFRelease(uuidString);
        NSLog(@"\n \n -------  CCKeychainStore重新存储UUID: %@  ------- \n",result);
        [CCKeychainStore save:CCKeychainStoreInsteadUUIDKey data:result];
        getUDIDInKeychain = (NSString *)[CCKeychainStore load:CCKeychainStoreInsteadUUIDKey];
    }
    NSLog(@"\n \n -------   CCKeychainStore获取的DeviceID: %@  ------- \n",getUDIDInKeychain);
    return getUDIDInKeychain;
}

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"\n \n ------- unarchive of %@ failed: %@ ------- \n", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)deleteDeviceID:(NSString *)insteadUUIDKey {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:insteadUUIDKey];
    SecItemDelete((CFDictionaryRef)keychainQuery);
    NSLog(@"\n \n -------  CCKeychainStore清除DeviceID成功  ------- \n");
}

@end
