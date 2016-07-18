//
//  DemoVC22.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/28.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC22.h"

@interface DemoVC22 ()

@property (nonatomic, strong) UIView *redView;


@end

@implementation DemoVC22

- (void)viewDidLoad {
    [super viewDidLoad];

    _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //同时缩放、平移、旋转
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @(arc4random_uniform(2) + 0.4);
    
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @(arc4random_uniform(M_PI));
    
    CABasicAnimation *position = [CABasicAnimation animation];
    position.keyPath = @"position";
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(300) + 20, arc4random_uniform(400))];
    group.animations = @[scale,rotation,position];
    
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [_redView.layer addAnimation:group forKey:nil];
    
    
}




@end
