//
//  DemoVC23.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/28.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC23.h"

@interface DemoVC23 ()

@property (nonatomic, strong) UIView *redView;


@end

@implementation DemoVC23

- (void)viewDidLoad {
    [super viewDidLoad];
    _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    NSLog(@"%@",NSStringFromCGPoint(_redView.layer.position));
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position";
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 400)];
    //注意:取消反弹代码必须放在图层添加动画之前
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.delegate = self;
    [_redView.layer addAnimation:anim forKey:nil];
//
//    [UIView animateWithDuration:0.25 animations:^{
//        _redView.layer.position = CGPointMake(150, 400);
//    } completion:^(BOOL finished) {
//        NSLog(@"%@",NSStringFromCGPoint(_redView.layer.position));
//
//    }];
    
}

//注意:核心动画一切都是假象，并不会真实的改变图层的属性值，如果以后做动画的时候，不需要用户交互的时候，通常用核心动画(转场)
//UIView动画必须通过修改属性的真实值，才有动画效果
//动画完成的时候调用

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"%@",NSStringFromCGPoint(_redView.layer.position));
}

@end
