//
//  XJVerticalButton.h
//  Pods-XJTools_OC_Example
//
//  Copyright © 2018 jingxuelong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJVerticalButton : UIButton

@property (nonatomic, copy) NSString *xj_title;

@property (nonatomic, copy) NSString *xj_imageName;

/**
 label 各边距离button距离，决定label大小
 */
@property (nonatomic, assign) UIEdgeInsets xj_titleEdgeInset;


/**
 imageView 各边距离button距离，决定imageView大小
 */
@property (nonatomic, assign) UIEdgeInsets xj_imageEdgeInset;


/**
 图片展示模式  default UIViewContentModeScaleAspectFit
 */
@property (nonatomic) UIViewContentMode  xj_imageContentMode;


/**
 标题对其格式  default NSTextAlignmentCenter
 */
@property (nonatomic) NSTextAlignment  xj_titleAlignmentMode;


+ (instancetype)buttonWithType:(UIButtonType)buttonType andImageName:(nullable NSString*)imageName andTitle:(NSString*)title andImageEdge:(UIEdgeInsets)imageInsetsEdge andTitleEdge:(UIEdgeInsets)titleInsetsEdge;

@end

NS_ASSUME_NONNULL_END
