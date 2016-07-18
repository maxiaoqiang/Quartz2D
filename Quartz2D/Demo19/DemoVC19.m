//
//  DemoVC19.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC19.h"

@interface DemoVC19 ()

@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation DemoVC19

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _imageView.image = [UIImage imageNamed:@"心"];
    [self.view addSubview:_imageView];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    //描述下修改哪个属性产生动画
    anim.keyPath = @"position";
    //设置值
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 500)];
    
    //只能是layer属性
    anim.keyPath = @"transform.scale";
    anim.toValue = @0.5;
    //设置动画之行次数
    anim.repeatCount = MAXFLOAT;
    //取消动画反弹
    //设置动画完成的时候不要移除动画
    anim.removedOnCompletion = NO;
    //设置动画之行完成要保持最新的效果
    anim.fillMode = kCAFillModeForwards;
    [_imageView.layer addAnimation:anim forKey:nil];
    
    
    
}

@end
