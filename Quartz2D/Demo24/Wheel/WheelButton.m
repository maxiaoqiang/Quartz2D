//
//  WheelButton.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/28.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "WheelButton.h"

@implementation WheelButton

//设置UIImageView的尺寸
//contentRect按钮的尺寸
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = 40;
    CGFloat imageH = 46;
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    CGFloat imageY = 20;
    return CGRectMake(imageX, imageY, imageW, imageH);
    
}


//取消高亮状态
-(void)setHighlighted:(BOOL)highlighted{

}

@end
