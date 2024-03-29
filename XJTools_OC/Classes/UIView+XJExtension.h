//
//  UIView+XJExtension.h
//  Pods
//
//  Created by Jingxuelong on 2018/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XJExtension)

@property (assign, nonatomic) CGFloat  xj_X;
@property (assign, nonatomic) CGFloat  xj_Y;
@property (assign, nonatomic) CGFloat  xj_Wide;
@property (assign, nonatomic) CGFloat  xj_Height;

@property (assign, nonatomic) CGFloat  xj_CenterX;
@property (assign, nonatomic) CGFloat  xj_CenterY;



/**
 根据view截图
 */
- (UIImage *)xj_getImageWithView:(UIView *)view;

/**
 根据view截图(根据设备scale 高清图)
 */
- (UIImage *)xj_getHighQuaImageWithView:(UIView *)view;



@end



@interface UIImage (XJExtension)


/**
根据颜色创建图片
*/
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
NS_ASSUME_NONNULL_END
