//
//  XJFileManager.m
//  Pods-XJTools_OC_Example
//
//  Created by 荆学龙 on 2019/7/19.
//

#import "XJFileManager.h"
@interface XJFileManager()

@end

@implementation XJFileManager

+ (NSString *)documentsPath{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
}
+ (NSString *)libraryPath{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
}
+ (NSString *)tempPath{
    return NSTemporaryDirectory();
}
+ (NSString *)preferencesPath{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
}
+ (NSString *)cachePath{
    return NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).lastObject;
}


+ (BOOL)pathIsFolder:(NSString*)path{
    BOOL isFolder = NO;
    [NSFileManager.defaultManager fileExistsAtPath:path isDirectory:&isFolder];
    return isFolder;
}

+ (BOOL)clearCache{
    return [NSFileManager.defaultManager removeItemAtPath:[self cachePath] error:nil];
}

+ (long long)cacheDataSize{
    return [self fileSizeAtPath:[self cachePath]];
}

+ (long long)fileSizeAtPath:(NSString*)path{
    long long size = 0;
    if ([self pathIsFolder:path]) {
        NSEnumerator *childFilesEnumerator = [[NSFileManager.defaultManager subpathsAtPath:path] objectEnumerator];
        NSString* fileName;        
        while ((fileName = [childFilesEnumerator nextObject]) != nil){
            NSString* fileAbsolutePath = [path stringByAppendingPathComponent:fileName];
            size += [self singleFileSizeWith:fileAbsolutePath];
        }
    }else{
        size = [self singleFileSizeWith:path];
    }
    return size;
}

+ (NSString*)changeStringSize:(long long)size{
    if (size < 1024.0) {
        return  [NSString stringWithFormat:@"%.2fB",size * 1.0];
    }else if (size >= 1024.0 && size < (1024.0*1024.0)){
        return  [NSString stringWithFormat:@"%.2fKB",size/1024.0];
    }if (size >= (1024.0*1024.0) && size < (1024.0*1024.0*1024.0)) {
        return [NSString stringWithFormat:@"%.2fMB", size/(1024.0*1024.0)];
    }else{
        return [NSString stringWithFormat:@"%.2fGB", size/(1024.0*1024.0*1024.0)];
    }
}


#pragma mark--<private menth>
+ (long long)singleFileSizeWith:(NSString*)path{
    long long size = 0;
    if ([NSFileManager.defaultManager fileExistsAtPath:path]){
        size = [[NSFileManager.defaultManager attributesOfItemAtPath:path error:nil] fileSize];
    }
    return size;
}

@end
