//
//  DemoVC24.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/28.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC24.h"
#import "WheelView.h"

@interface DemoVC24 ()

@property (nonatomic, strong) WheelView *wheelView;


@end

@implementation DemoVC24

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加转盘view
    WheelView *view = [WheelView wheelView];
    _wheelView = view;
    view.center = self.view.center;
    [self.view addSubview:view];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setFrame:CGRectMake(50, 80, 80, 30)];
    [startBtn setBackgroundColor:[UIColor orangeColor]];
    [startBtn addTarget:self action:@selector(handleStartAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"结束" forState:UIControlStateNormal];
    [stopBtn setFrame:CGRectMake(50 + 150, 80, 80, 30)];
    [stopBtn setBackgroundColor:[UIColor orangeColor]];
    [stopBtn addTarget:self action:@selector(handleStopAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}
//开始
-(void)handleStartAction:(UIButton *)sender{
    [_wheelView start];
}

//结束
-(void)handleStopAction:(UIButton *)sender{
    [_wheelView pause];

}



@end
