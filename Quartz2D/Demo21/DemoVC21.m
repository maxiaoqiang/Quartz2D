//
//  DemoVC21.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC21.h"

@interface DemoVC21 ()

@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation DemoVC21

- (void)viewDidLoad {
    [super viewDidLoad];

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:_imageView];
}
static int i = 2;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //转场代码
    if (i == 4) {
        i = 1;
    }
    NSString *imageN = [NSString stringWithFormat:@"%d",i];
    _imageView.image = [UIImage imageNamed:imageN];
      i ++;
    NSLog(@"%d",i);
    //转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"cute";
    anim.duration = 2;
    [_imageView.layer addAnimation:anim forKey:nil];
    
    
}

@end
