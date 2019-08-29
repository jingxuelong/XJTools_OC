//
//  XJViewController.m
//  XJTools_OC
//
//  Created by jingxuelong on 07/19/2019.
//  Copyright (c) 2019 jingxuelong. All rights reserved.
//

#import "XJViewController.h"
#import <objc/runtime.h>
#import <XJTools_OC.h>
#import "EXTScope.h"

#import "XJLocalModel.h"

@interface XJViewController ()

@end

@implementation XJViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    view.xj_Wide = 200;
    view.xj_Height = 100;
    view.xj_CenterX = XJ_Screen_Wide/2.0;
    view.xj_CenterY = XJ_Screen_Height/2.0;
//    [self.view addSubview:view];
    
//    XJLocalModel *model = [[XJLocalModel alloc] init];
//    model.name = @"XJLocalModel";
//    model.time = @"10:41";
    
//     [XJCacheManager.shareManager xj_setObject_DishCache:model forKey:@"LocalModel"];
//    XJLocalModel *model = [XJCacheManager.shareManager xj_ObjectForKey_DishCache:@"LocalModel"];
    
    XJVerticalButton *button = [XJVerticalButton buttonWithType:UIButtonTypeCustom];
    button.xj_Wide = 200;
    button.xj_Height = 100;
    button.xj_CenterX = XJ_Screen_Wide/2.0;
    button.xj_CenterY = XJ_Screen_Height/2.0;
    button.backgroundColor = UIColor.lightGrayColor;
    button.xj_title = @"abc";
    button.xj_imageName = @"broadDefault-1";

//    [self.view addSubview:button];
    
    
    XJVerticalButton *buttonA = [XJVerticalButton buttonWithType:UIButtonTypeCustom andImageName:@"broadDefault-1" andTitle:@"Button" andImageEdge:UIEdgeInsetsMake(10, 75, 40, 75) andTitleEdge:UIEdgeInsetsMake(70, 0, 10, 0)];
    buttonA.xj_Wide = 200;
    buttonA.xj_Height = 100;
    buttonA.xj_CenterX = XJ_Screen_Wide/2.0;
    buttonA.xj_CenterY = XJ_Screen_Height/2.0;
    buttonA.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:buttonA];
    
    
    @weakify(self);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@",XJFileManager.documentsPath);
        @strongify(self);
        NSURL *webGifImageUrl = [NSURL URLWithString:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2805094609,3291864996&fm=26&gp=0.gif"];
        NSData *data = [NSData dataWithContentsOfURL:webGifImageUrl];
        //cache目录每次写入
        NSString *cachefilePath = [XJFileManager getPath:XJFileManager.cachePath andDirectoryName:nil andFileName:@"cachename.gif"];
        BOOL success = [data writeToFile:cachefilePath atomically:YES];
        if (!success) {
            NSLog(@"cachefilePath write error");
        }
        
        
        //write data
        BOOL hasWrite = [NSUserDefaults.standardUserDefaults boolForKey:@"HasWrite"];
        if (!hasWrite) {
            
            //Document 单个文件
            NSString *filePath = [XJFileManager getPath:XJFileManager.documentsPath andDirectoryName:nil andFileName:@"name.gif"];
            BOOL success = [data writeToFile:filePath atomically:YES];
            if (!success) {
                NSLog(@"Document write error");
            }
            
            //Library 创建文件夹 多个文件
            for (int i = 0; i<10 ;i++ ){
                NSString *libraryfilePath = [XJFileManager getPath:XJFileManager.libraryPath andDirectoryName:@"Many" andFileName:[NSString stringWithFormat:@"name%d.gif",i]];
                BOOL success = [data writeToFile:libraryfilePath atomically:YES];
                if (!success) {
                    NSLog(@"LibraryPath write error");
                }
                
            }
            
            [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"HasWrite"];
            [NSUserDefaults.standardUserDefaults synchronize];
        }
        
         success = [XJCacheManager.shareManager xj_setObject_DishCache:@"abc" forKey:@"name"];
        NSString *name = [XJCacheManager.shareManager xj_ObjectForKey_DishCache:@"name"];
        NSLog(@"aaaa= = %@",name);
        [self logFileAndPathSize];

    });
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self logFileAndPathSize];
}


- (void)logFileAndPathSize{
    
    NSString *filePath = [XJFileManager getPath:XJFileManager.documentsPath andDirectoryName:@"" andFileName:@"name.gif"];
    long long fileSize = [XJFileManager fileSizeAtPath:filePath];
    NSLog(@"FileSize%@",[XJFileManager changeStringSize:fileSize]);
    
    long long pathDocumentSize = [XJFileManager fileSizeAtPath:XJFileManager.documentsPath];
    NSLog(@"pathDocumentSize%@",[XJFileManager changeStringSize:pathDocumentSize]);
    
    long long pathLibrarySize = [XJFileManager fileSizeAtPath:XJFileManager.libraryPath];
    NSLog(@"pathLibrarySize%@",[XJFileManager changeStringSize:pathLibrarySize]);
}

void JprintMenthWithClass(Class class){
    
    
    unsigned int Count;
    //加深一层
    class = object_getClass(class);
    
    Method *menthPoint = class_copyMethodList(class, &Count);
    for (int i = 0; i<Count; i++) {
        Method meth = menthPoint[i];
        NSLog(@"%@",NSStringFromSelector(method_getName(meth)));
    }
    free(menthPoint);
    
    Count = 0;
    
    Ivar *varlist = class_copyIvarList(class, &Count);
    
    for (int i = 0; i<Count; i++) {
        Ivar var = varlist[i];
        NSLog(@"%@",[NSString stringWithUTF8String:ivar_getName(var)]);
    }
    
    free(varlist);
    
    Count = 0;
    
    objc_property_t *objc_propertyList = class_copyPropertyList(class, &Count);
    
    for (int i = 0; i<Count; i++) {
        objc_property_t objc_property = objc_propertyList[i];
        NSLog(@"%@",[NSString stringWithUTF8String:property_getName(objc_property)]);
    }
    free(objc_propertyList);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
