//
//  Header.h
//  XJTools_OC
//
//  Copyright © 2018 jingxuelong. All rights reserved.
//

#ifndef XJTools_OC_h
#define XJTools_OC_h

//高度值 常量
#define k_XJScreen_Wide                          [UIScreen mainScreen].bounds.size.width
#define k_XJScreen_Height                        [UIScreen mainScreen].bounds.size.height

#define k_XJStatusBarHeight       (is_XJIphoneWithSafeArea? 44.0 : 20.0)
#define k_XJNavHeight             44.0
#define k_XJBothNavAndStatusHeight    (k_XJStatusBarHeight+k_XJNavHeight)

#define k_XJTabbarHeight          49.0
#define k_XJTabbarSafeAreaHeight      (is_XJIphoneWithSafeArea? 34.0 : 0.0)
#define k_XJBothTabbarAndSafeAreaHeight          (k_XJTabbarHeight+k_XJTabbarSafeAreaHeight)

//适配值
#define XJWideScale               (k_XJScreen_Wide/375.0)
#define XJAutoValue(value)               (XJWideScale*(value))
#define XJAutoWideValueIphoneXAppend(value,append)     (is_XJIphoneWithSafeArea ? XJAutoValue(value+append) : XJAutoValue(value))

//BOOL 判断值
#define is_XJIphone                  ((UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone)?YES:NO)

#define is_XJIphoneWithSafeArea \
({BOOL hasSafeArea = NO;\
if (@available(iOS 11.0, *)) {\
hasSafeArea = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(hasSafeArea && is_XJIphone);})


//字体

//苹方-简 常规体       PingFangSC-Regular
#define XJFontPF_Regular(Value)       [UIFont fontWithName:@"PingFangSC-Regular" size:Value]
//苹方-简 中黑体      PingFangSC-Medium
#define XJFontPF_Medium(Value)       [UIFont fontWithName:@"PingFangSC-Medium" size:Value]
//苹方-简 中粗体      PingFangSC-Semibold
#define XJFontPF_Semibold(Value)       [UIFont fontWithName:@"PingFangSC-Semibold" size:Value]
//苹方-简 细体        PingFangSC-Light
#define XJFontPF_Light(Value)       [UIFont fontWithName:@"PingFangSC-Light" size:Value]
//苹方-简 极细体       PingFangSC-Ultralight
#define XJFontPF_Ultralight(Value)       [UIFont fontWithName:@"PingFangSC-Ultralight" size:Value]
//苹方-简 纤细体       PingFangSC-Thin
#define XJFontPF_Thin(Value)       [UIFont fontWithName:@"PingFangSC-Thin" size:Value]


//颜色
#define XJ_ColorFromRGB(rgbValue)               [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define XJ_ColorFromRGBWithA(rgbValue,A)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]



//header
#import <XJFileManager.h>
#import "XJCacheManager.h"
#import "XJ_UI_Creater.h"
#import "XJVerticalButton.h"
#import "UIView+XJExtension.h"

#endif /* Header_h */
