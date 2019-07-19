//
//  XJFileManager.h
//  Pods-XJTools_OC_Example
//
//  Created by 荆学龙 on 2019/7/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJFileManager : NSObject


/**
 Documents目录
 */
@property (copy,nonatomic,readonly,class) NSString* documentsPath;

/**
 Library目录
 */
@property (copy,nonatomic,readonly,class) NSString* libraryPath;

/**
 Temp目录
 */
@property (copy,nonatomic,readonly,class) NSString* tempPath;

/**
 cache目录
 */
@property (copy,nonatomic,readonly,class) NSString* cachePath;

/**
 preferences目录
 */
@property (copy,nonatomic,readonly,class) NSString* preferencesPath;


/**
 路径是否为文件夹

 @param path  path
 @return bool value
 */
+ (BOOL)pathIsFolder:(NSString*)path;

/**
 指定路径文件或者文件夹大小

 @param path 文件或文件夹路径
 @return size
 */
+ (long long)fileSizeAtPath:(NSString*)path;

/**
 清空Library 中cache文件夹

 @return 是否成功
 */
+ (BOOL)clearCache;

/**
 当前cache文件夹size

 @return  size
 */
+ (long long)cacheDataSize;

/**
 返回字符串格式size

 @param size long long
 @return NSString类型
 */
+ (NSString*)changeStringSize:(long long)size;

@end

NS_ASSUME_NONNULL_END
