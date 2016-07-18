//
//  GrainView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/7/8.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "GrainView.h"

@interface GrainView()
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, weak) CALayer *dotLayer;
@property (nonatomic, weak) CAReplicatorLayer *repL;




@end

@implementation GrainView

#pragma mark--懒加载点层

-(CALayer *)dotLayer{
    if (_dotLayer == nil) {
        //创建图层
        //创建图层
        CALayer *layer = [CALayer layer];
        CGFloat wh = 10;
        layer.frame = CGRectMake(0, 10, wh, wh);
        layer.cornerRadius = wh / 2.0;
        layer.backgroundColor = [UIColor blueColor].CGColor;
        [_repL addSublayer:layer];
        _dotLayer = layer;
    }
    return _dotLayer;
}

-(UIBezierPath *)path{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘
//    [self reDraw];
    
    //获取touch对象
    UITouch *touch = [touches anyObject];
    //获取当前触摸点
    CGPoint curP = [touch locationInView:self];
    //创建一个路径
    //设置起点
    [self.path moveToPoint:curP];

}


static int _instanceCount = 0;
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取touch对象
    UITouch *touch = [touches anyObject];
    //获取当前触摸点
    CGPoint curP = [touch locationInView:self];
    //添加线到某个点
    [_path addLineToPoint:curP];
    //重绘
    [self setNeedsDisplay];
    
    _instanceCount ++;
}

-(void)drawRect:(CGRect)rect{
    [_path stroke];
}

#pragma mark-开始动画
-(void)startAnim{
    //创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = _path.CGPath;
    anim.duration = 20;
    anim.repeatCount = MAXFLOAT;
    [self.dotLayer addAnimation:anim forKey:nil];
    
    //复制子层
    _repL.instanceCount = _instanceCount;
    _repL.instanceDelay = 0.2;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}



-(void)setUp{
    //创建复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.bounds;
    [self.layer addSublayer:repL];
    _repL = repL;
    
}


-(void)reDraw{
    _path = nil;
    [self setNeedsDisplay];
    //把图层移除父控件，复制层也会移除
    [_dotLayer removeFromSuperlayer];
    _dotLayer = nil;
    
    //清空子层总数
    _instanceCount = 0;
}

@end
