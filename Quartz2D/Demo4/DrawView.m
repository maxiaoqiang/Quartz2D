//
//  DrawView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

-(void)drawRect:(CGRect)rect{
    
    //超出裁剪区域的内容全部裁剪掉
    //注意:裁剪必须放在绘制之前
//    UIRectClip(CGRectMake(0, 0, 50, 50));
    
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //默认绘制的内容尺寸跟图片尺寸一样大
    [image drawAtPoint:CGPointZero];
    [image drawInRect:rect];
//    [image drawAsPatternInRect:rect];
}

-(void)drawAttribution{
    //绘制文字
    NSString * str = @"北京欢迎你";
    //文字的起点
    //Attributes:文本属性
    NSMutableDictionary *textDict = [NSMutableDictionary dictionary];
    //设置文字颜色
    textDict[NSForegroundColorAttributeName] = [UIColor redColor];
    //设置文字字体
    textDict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    //设置文字的空心颜色和宽度
    textDict[NSStrokeWidthAttributeName] = @3;
    textDict[NSStrokeColorAttributeName] = [UIColor yellowColor];
    
    //创建阴影对象
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor purpleColor];
    shadow.shadowOffset = CGSizeMake(4, 4);
    shadow.shadowBlurRadius = 3;
    textDict[NSShadowAttributeName] = shadow;
    //富文本:给普通的文字添加颜色，字体大小
    [str drawAtPoint:CGPointZero withAttributes:textDict];
}


-(void)drawText{
    //绘制文字
    NSString *str = @"北京欢迎你，北京欢迎你，北京欢迎你.北京欢迎你，北京欢迎你，北京欢迎你,北京欢迎你，北京欢迎你，北京欢迎你";
    //不会换行
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    [str drawInRect:self.bounds withAttributes:nil];
}

@end
