//
//  UIView+XJExtension.m
//  Pods
//
//  Created by Jingxuelong on 2019/7/20.
//

#import "UIView+XJExtension.h"

@implementation UIView (XJExtension)

#pragma mark--<Setter and Getter>
- (void)setXj_X:(CGFloat)xj_X{
    CGRect rect = self.frame;
    rect.origin.x = xj_X;
    self.frame = rect;
}

- (void)setXj_Y:(CGFloat)xj_Y{
    CGRect rect = self.frame;
    rect.origin.y = xj_Y;
    self.frame = rect;
}

- (void)setXj_Wide:(CGFloat)xj_Wide{
    CGRect rect = self.frame;
    rect.size.width = xj_Wide;
    self.frame = rect;
}

- (void)setXj_Height:(CGFloat)xj_Height{
    CGRect rect = self.frame;
    rect.size.height = xj_Height;
    self.frame = rect;
}

- (void)setXj_CenterX:(CGFloat)xj_CenterX{
    CGPoint center = self.center;
    center.x = xj_CenterX;
    self.center = center;
}

- (void)setXj_CenterY:(CGFloat)xj_CenterY{
    CGPoint center = self.center;
    center.y = xj_CenterY;
    self.center = center;
}

- (CGFloat)xj_X{
    return self.frame.origin.x;
}
- (CGFloat)xj_Y{
    return self.frame.origin.y;
}
- (CGFloat)xj_Wide{
    return self.frame.size.width;
}
- (CGFloat)xj_Height{
    return self.frame.size.height;
}
-(CGFloat)xj_CenterX{
    return self.center.x;
}
- (CGFloat)xj_CenterY{
    return self.center.y;
}


- (UIImage *)xj_getHighQuaImageWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, 1, UIScreen.mainScreen.scale);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)xj_getImageWithView:(UIView *)view{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
