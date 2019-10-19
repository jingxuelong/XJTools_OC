//
//  XJVerticalButton.m
//  Pods-XJTools_OC_Example
//
//  Copyright © 2018 jingxuelong. All rights reserved.
//

#import "XJVerticalButton.h"
@interface XJVerticalButton()

@end

@implementation XJVerticalButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType{
   
    return [XJVerticalButton buttonWithType:buttonType andImageName:nil andTitle:@"Button" andImageEdge:UIEdgeInsetsZero andTitleEdge:UIEdgeInsetsZero];
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType andImageName:(nullable NSString*)imageName andTitle:(NSString*)title andImageEdge:(UIEdgeInsets)imageInsetsEdge andTitleEdge:(UIEdgeInsets)titleInsetsEdge{
    XJVerticalButton *button = [super buttonWithType:buttonType];
    button.xj_title = title;
    button.xj_imageName = imageName;
    button.xj_imageEdgeInset = imageInsetsEdge;
    button.xj_titleEdgeInset = titleInsetsEdge;
    button.xj_imageContentMode = UIViewContentModeScaleAspectFit;
    button.xj_titleAlignmentMode = NSTextAlignmentCenter;
    return button;
}

- (void)setXj_imageContentMode:(UIViewContentMode)xj_imageContentMode{
    _xj_imageContentMode = xj_imageContentMode;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

}

- (void)setXj_titleAlignmentMode:(NSTextAlignment)xj_titleAlignmentMode{
    _xj_titleAlignmentMode = xj_titleAlignmentMode;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setXj_title:(NSString *)xj_title{
    _xj_title = xj_title;
    [self setTitle:xj_title forState:UIControlStateNormal];
}

- (void)setXj_imageName:(NSString *)xj_imageName{
    
    _xj_imageName = xj_imageName;
    UIImage *image = nil;
    if (xj_imageName) {
        image = [UIImage imageNamed:xj_imageName];
    }
    [self setImage:image forState:UIControlStateNormal];
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat height = CGRectGetHeight(contentRect);
    CGFloat wide = CGRectGetWidth(contentRect);
    if (UIEdgeInsetsEqualToEdgeInsets(self.xj_titleEdgeInset, UIEdgeInsetsZero) ) {
        return CGRectMake(0, height*2/3.0, wide, height/3.0);
    }else{
        CGFloat titleWide = wide - self.xj_titleEdgeInset.left - self.xj_titleEdgeInset.right;
        CGFloat titleHeight = height - self.xj_titleEdgeInset.top - self.xj_titleEdgeInset.bottom;
        return CGRectMake(self.xj_titleEdgeInset.left, self.xj_titleEdgeInset.top, titleWide, titleHeight);
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat height = CGRectGetHeight(contentRect);
    CGFloat wide = CGRectGetWidth(contentRect);
    if (UIEdgeInsetsEqualToEdgeInsets(self.xj_imageEdgeInset, UIEdgeInsetsZero) ) {
        return CGRectMake(0, 0, wide, height*2/3.0);
    }else{
        CGFloat imageWide = wide - self.xj_imageEdgeInset.left - self.xj_imageEdgeInset.right;
        CGFloat imageHeight = height - self.xj_imageEdgeInset.top - self.xj_imageEdgeInset.bottom;
        return CGRectMake(self.xj_imageEdgeInset.left, self.xj_imageEdgeInset.top, imageWide, imageHeight);
    }
}

@end
