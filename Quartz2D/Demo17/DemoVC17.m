//
//  DemoVC17.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC17.h"
#define angle2radion(angle) ((angle)/ 180.0 * M_PI)


@interface DemoVC17 ()

@property (nonatomic, strong) UIView *blueView;


@end

@implementation DemoVC17

- (void)viewDidLoad {
    [super viewDidLoad];
    _blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_blueView];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(200, 150);
    layer.bounds = CGRectMake(0, 0, 80, 80);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //旋转
    //1~360
    _blueView.layer.transform = CATransform3DMakeRotation(angle2radion(arc4random_uniform(360) + 1), 0, 0, 1);
    _blueView.layer.position = CGPointMake(arc4random_uniform(200) + 20, arc4random_uniform(400) + 50);
    _blueView.layer.cornerRadius = arc4random_uniform(50);
    _blueView.layer.backgroundColor = [self randomColor].CGColor;
    _blueView.layer.borderWidth = arc4random_uniform(10);
    _blueView.layer.borderColor = [self randomColor].CGColor;
}


-(UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}


@end
