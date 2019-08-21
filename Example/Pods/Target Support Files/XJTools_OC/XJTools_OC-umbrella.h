#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIView+XJExtension.h"
#import "XJCacheManager.h"
#import "XJFileManager.h"
#import "XJTools_OC.h"

FOUNDATION_EXPORT double XJTools_OCVersionNumber;
FOUNDATION_EXPORT const unsigned char XJTools_OCVersionString[];

