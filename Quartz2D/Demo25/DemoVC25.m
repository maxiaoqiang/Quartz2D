//
//  DemoVC25.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/7/8.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC25.h"
#import "GrainView.h"


@implementation DemoVC25



-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.Gview = [[GrainView alloc] initWithFrame:self.view.frame];
    self.Gview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.Gview];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setTitle:@"开始动画" forState:UIControlStateNormal];
    startBtn.frame = CGRectMake(50, 100, 100, 30);
    startBtn.backgroundColor = [UIColor orangeColor];
    [startBtn addTarget:self action:@selector(startAnim:) forControlEvents:UIControlEventTouchUpInside];
    [self.Gview addSubview:startBtn];
    
    
    UIButton *reDrawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [reDrawBtn setTitle:@"重绘" forState:UIControlStateNormal];
    reDrawBtn.frame = CGRectMake(250, 100, 100, 30);
    reDrawBtn.backgroundColor = [UIColor orangeColor];
    [reDrawBtn addTarget:self action:@selector(reDrawBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.Gview addSubview:reDrawBtn];
    
}


#pragma mark-点击开始动画
-(void)startAnim:(UIButton *)sender{

    [self.Gview startAnim];
}

-(void)reDrawBtn:(UIButton *)sender{
    [self.Gview reDraw];
}

@end
