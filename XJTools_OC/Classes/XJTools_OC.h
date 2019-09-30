//
//  Header.h
//  XJTools_OC
//
//  Created by Jingxuelong on 2018/4/21.
//  Copyright © 2019 jingxuelong. All rights reserved.
//

#ifndef XJTools_OC_h
#define XJTools_OC_h

//高度值
#define k_XJScreen_Wide                          [UIScreen mainScreen].bounds.size.width
#define k_XJScreen_Height                        [UIScreen mainScreen].bounds.size.height
#define k_XJStatusBarHeight       UIApplication.sharedApplication.statusBarFrame.size.height
#define k_XJNavHeight             44.0
#define k_XJBothNavAndStatusHeight    (k_XJStatusBarHeight+k_XJNavHeight)
#define k_XJTabbarHeight          49.0
#define k_XJTabbarSafeAreaHeight      is_XJIphoneWithSafeArea?34.0:0.0
#define k_XJBothTabbarAndSafeAreaHeight          (k_XJTabbarHeight+k_XJTabbarSafeAreaHeight)


#define is_XJIphone                  UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone?YES:NO
#define is_XJIphoneWithSafeArea \
({BOOL hasSafeArea = NO;\
if (@available(iOS 11.0, *)) {\
hasSafeArea = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(hasSafeArea && is_XJIphone);})

#define XJ_ColorFromRGB(rgbValue)               [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define XJ_ColorFromRGBWithA(rgbValue,A)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]


#import <XJFileManager.h>
#import "XJCacheManager.h"
#import "XJ_UI_Creater.h"
#import "XJVerticalButton.h"
#import "UIView+XJExtension.h"

#endif /* Header_h */
