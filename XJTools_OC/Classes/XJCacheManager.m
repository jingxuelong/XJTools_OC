//
//  XJCacheManager.m
//  Pods-XJTools_OC_Example
//
//  Created by Jingxuelong on 2018/4/21.
//

#import "XJCacheManager.h"
#import <UIKit/UIKit.h>
#import "XJFileManager.h"

#define XJ_DISH_MEMORY_DIR                  @"XJ_DISH_MEMORY_DIR"
@interface XJCacheManager()

@property (nonatomic, strong) NSCache *memoryCache;

@end

@implementation XJCacheManager

+ (void)load{
    [XJCacheManager shareManager];
}

+ (XJCacheManager *)shareManager{
    static dispatch_once_t once;
    static id XJacheManager;
    dispatch_once(&once, ^{
        XJacheManager = [super alloc];
        [NSNotificationCenter.defaultCenter addObserver:XJacheManager selector:@selector(clearMemoryCache) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
        
    });
    return XJacheManager;
}

- (nullable id)xj_ObjectForKey_MemoryCache:(nonnull id)key{
    return [self.memoryCache objectForKey:key];
}

- (void)xj_setObject_MemoryCache:(nullable id)object forKey:(nonnull id)key{
    if (object) {
        [self.memoryCache setObject:object forKey:key];
    }else{
        [self.memoryCache removeObjectForKey:key];
    }
}


- (BOOL)xj_setObject_DishCache:(nullable id <NSCoding>)object forKey:(nonnull NSString*)key{
    NSString *path = [XJFileManager getPath:XJFileManager.libraryPath andDirectoryName:XJ_DISH_MEMORY_DIR andFileName:key];
    return [NSKeyedArchiver archiveRootObject:object toFile:path];
}

- (nullable id)xj_ObjectForKey_DishCache:(nonnull NSString*)key{
    NSString *path = [XJFileManager getPath:XJFileManager.libraryPath andDirectoryName:XJ_DISH_MEMORY_DIR andFileName:key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void)xj_clearAllDishCache{
    NSString *path = [XJFileManager getPath:XJFileManager.libraryPath andDirectoryName:XJ_DISH_MEMORY_DIR andFileName:nil];
    [XJFileManager clearAllItemsAtPath:path];
}
/**
 收到内存警告释放内存
 */
- (void)clearMemoryCache{
    [self.memoryCache removeAllObjects];
}


- (NSCache *)memoryCache{
    if (_memoryCache == nil) {
        _memoryCache = [[NSCache alloc] init];
    }
    return _memoryCache;
}

@end
