//
//  AdaptiveScreen.h
//  CCTools
//
//  Created by 车 on 2019/1/18.
//  Copyright © 2019 车. All rights reserved.
//

#ifndef AdaptiveScreen_h
#define AdaptiveScreen_h

// --- 只适用竖屏
/**
 * 屏幕适配 - iPhoneX全系
 */
#define kiPhoneXAll (kiPhoneX || kiPhoneXR || kiPhoneXS_Max)

/**
 * iPhoneX全系导航栏增加高度 (64->88)
 */
#define kiPhoneX_Top_Height (kiPhoneXAll ? 24 : 0)

/**
 * iPhoneX全系TabBar增加高度 (49->83)
 */
#define kiPhoneX_Bottom_Height (kiPhoneXAll ? 34 : 0)
// ---


// 适配 iPhoneNumber 和 x 系列 导航栏高度
#define kNavBarHeightAdaptive (kiPhoneXAll ? (kNavBarHeightDefault + kiPhoneX_Top_Height) : kNavBarHeightDefault)

// 适配 iPhoneNumber 和 x 系列 tabBar高度
#define kTabBarHeightAdaptive (kiPhoneXAll ? (kTabBarHeightDefault + kiPhoneX_Bottom_Height) : kTabBarHeightDefault)

// tabBar高度
#define kTabBarHeightDefault 49.f

// 导航栏高度
#define kNavBarHeightDefault 64.f

// 是否是iPhoneX
#define kiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 是否是iPhoneXR系列
#define kiPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 是否是iPhoneXS_Max
#define kiPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#endif /* AdaptiveScreen_h */
