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
@property (copy,nonatomic,readonly,class) NSString* libraryPath;
@property (copy,nonatomic,readonly,class) NSString* tempPath;
@property (copy,nonatomic,readonly,class) NSString* cachePath;
@property (copy,nonatomic,readonly,class) NSString* preferencesPath;



@end

NS_ASSUME_NONNULL_END
