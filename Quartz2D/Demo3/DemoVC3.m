//
//  DemoVC3.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC3.h"
#import "BarView.h"

@implementation DemoVC3

-(void)viewDidLoad{
    [super viewDidLoad];
    
    BarView *bar= [[BarView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    bar.center = self.view.center;
    bar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bar];
    
}


@end
