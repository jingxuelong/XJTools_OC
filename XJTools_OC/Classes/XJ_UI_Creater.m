
/**
 
 Created     by JXL
 Copyright   JXL. All rights reserved.
 CreateDate: 2019/8/25
 E_Mail:     jingxuelong@gmail.com
 
 */

#import "XJ_UI_Creater.h"
@interface XJ_UI_Creater()

@end

@implementation XJ_UI_Creater

+ (UIButton *)getButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font imageName:(NSString *)imageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return button;
}





@end
