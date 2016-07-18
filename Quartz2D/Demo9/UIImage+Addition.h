//
//  UIImage+Addition.h
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/24.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

//圆形裁剪
+(UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

//控件截屏
+(UIImage *)imageWithCaputureView:(UIView *)view;

@end
