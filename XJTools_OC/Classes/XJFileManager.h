//
//  XJFileManager.h
//  Pods-XJTools_OC_Example
//
//  Created by Jingxuelong on 2018/4/21.
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
 根据传入路径，中间文件夹 和文件名返回路径

 @param path 传入path
 @param directoryName 创建文件夹名称 传nil为不创建 @"file" 可创建多层@"file/abc"
 @param fileName 文件名  file 为nil 时候为创建文件夹路径
 @return 返回创建后path  为nil 时候为创建失败
 */
+ (nullable NSString*)getPath:(NSString*)path andDirectoryName:(nullable NSString*)directoryName andFileName:(nullable NSString*)fileName;

/**
 指定路径文件或者文件夹大小

 @param path 文件或文件夹路径
 @return size
 */
+ (long long)fileSizeAtPath:(NSString*)path;



/**
 清除m路径文件

 @param path path
 @return 是否清除成功
 */
+ (BOOL)clearAllItemsAtPath:(NSString*)path;


/**
 返回字符串格式size

 @param size long long
 @return NSString类型
 */
+ (NSString*)changeStringSize:(long long)size;


@end

NS_ASSUME_NONNULL_END
