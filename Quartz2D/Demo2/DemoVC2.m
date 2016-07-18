//
//  DemoVC2.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC2.h"
#import "PieView.h"

@implementation DemoVC2

-(void)viewDidLoad{
    [super viewDidLoad];
    
    PieView *pie= [[PieView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    pie.center = self.view.center;
    pie.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pie];
}

@end
