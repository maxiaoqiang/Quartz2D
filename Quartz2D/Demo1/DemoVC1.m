//
//  DemoVC1.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC1.h"
#import "ProgressView.h"

@interface DemoVC1()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) ProgressView *progress;


@end

@implementation DemoVC1

-(void)viewDidLoad{
    [super viewDidLoad];
    ProgressView *progress= [[ProgressView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    progress.center = self.view.center;
    progress.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:progress];
    
    _progress = progress;
    
    _label = [[UILabel alloc] initWithFrame:progress.frame];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.center = progress.center;
    _label.text = @"0.00%";
    [self.view addSubview:_label];
    
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, progress.center.y + 150, 250, 10)];
    [slider addTarget:self action:@selector(handelSliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
}

-(void)handelSliderChange:(UISlider *)sender{
    _label.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    
    self.progress.progress = sender.value;
}

@end
