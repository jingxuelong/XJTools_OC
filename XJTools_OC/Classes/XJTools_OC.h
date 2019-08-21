//
//  Header.h
//  XJTools_OC
//
//  Created by Jingxuelong on 2018/4/21.
//  Copyright © 2019 jingxuelong. All rights reserved.
//

#ifndef XJTools_OC_h
#define XJTools_OC_h

#define XJ_Screen_Wide                          [UIScreen mainScreen].bounds.size.width
#define XJ_Screen_Height                        [UIScreen mainScreen].bounds.size.height
#define XJ_ColorFromRGB(rgbValue)               [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define XJ_ColorFromRGBWithA(rgbValue,A)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]



#import <XJFileManager.h>
#import "UIView+XJExtension.h"

#endif /* Header_h */
