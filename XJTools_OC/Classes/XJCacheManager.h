//
//  XJCacheManager.h
//  Pods-XJTools_OC_Example
//
//  Created by Jingxuelong on 2018/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJCacheManager : NSObject


@property (strong, class, readonly) XJCacheManager *shareManager;


/**
 内存缓存---收到内存警告自动释放
 */
- (void)xj_setObject_MemoryCache:(nullable id)object forKey:(nonnull id)key;
- (nullable id)xj_ObjectForKey_MemoryCache:(nonnull id)key;


/**
 磁盘缓存---默认路径Library下 XJ_DISH_MEMORY_DIR文件夹
 @param object  对象归档处理遵从归档协议
 @param key 字符串key 作为文件名
 @return  BOOL 是否写入成功
 */
- (BOOL)xj_setObject_DishCache:(nullable id <NSCoding>)object forKey:(nonnull NSString*)key;
- (nullable id)xj_ObjectForKey_DishCache:(nonnull NSString*)key;


/**
 本类写入Library下数据
 */
- (void)xj_clearAllDishCache;


@end

NS_ASSUME_NONNULL_END
