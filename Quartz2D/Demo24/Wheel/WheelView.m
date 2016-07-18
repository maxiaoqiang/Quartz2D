//
//  WheelView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/28.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "WheelView.h"
#import "WheelButton.h"


@interface WheelView()
@property (weak, nonatomic) IBOutlet UIImageView *centerView;

@property (nonatomic, strong) UIButton *selBtn;

@end
@implementation WheelView

+(instancetype)wheelView{
    return [[NSBundle mainBundle]loadNibNamed:@"WheelView" owner:nil options:nil][0];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]) {
        //注意:这个方法只是在加载xib的时候会调用，但是并没有连好线
    }
    return self;
}

-(void)awakeFromNib{
    
    _centerView.userInteractionEnabled = YES;
    
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    CGFloat wh = self.bounds.size.width;
    //加载大图片
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    //加载选中大图片
    UIImage *selBigImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    
    
    //获取当前使用的图片像素和点的比例
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat imageW = bigImage.size.width /12 * scale;
    CGFloat imageH = bigImage.size.height * scale;
    
    //CGImageRef  _Nullable imagev:需要裁剪的图片
    //CGRect rect:裁剪区域
    //裁剪区域是以像素为基准
//    CGImageCreateWithImageInRect(CGImageRef  _Nullable image, CGRect rect);
    
    //添加按钮
    for (int i = 0; i < 12; i ++) {
        WheelButton *btn = [WheelButton buttonWithType:UIButtonTypeCustom];
        //设置按钮的位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
        btn.layer.position = CGPointMake(wh * 0.5, wh * 0.5);
        //按钮的旋转角度
        CGFloat radion = (30 * i) / 180.0 * M_PI;
        btn.transform = CGAffineTransformMakeRotation(radion);
        [_centerView addSubview:btn];
        
        //加载按钮的图片
        //计算裁剪区域
        CGRect clipR = CGRectMake(i * imageW, 0, imageW, imageH);
        //裁剪图片
        CGImageRef imgR = CGImageCreateWithImageInRect(bigImage.CGImage, clipR);
        UIImage * image = [UIImage imageWithCGImage:imgR];
        [btn setImage:image forState:UIControlStateNormal];
        
        
        imgR = CGImageCreateWithImageInRect(selBigImage.CGImage, clipR);
        image = [UIImage imageWithCGImage:imgR];
        //设置按钮的图片
        [btn setImage:image forState:UIControlStateSelected];
        // 设置选中背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        //监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //默认选中第一个
        if (i == 0) {
            [self btnClick:btn];
        }
        
        
    }
}

-(void)btnClick:(UIButton *)sender{
    _selBtn.selected = NO;
    sender.selected = YES;
    _selBtn = sender;
}

#pragma mark--开始旋转
-(void)start{
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 2);
    anim.duration = 2;
    anim.repeatCount = MAXFLOAT;
    [_centerView.layer addAnimation:anim forKey:nil];
    
}

-(void)pause{

    
}

@end
