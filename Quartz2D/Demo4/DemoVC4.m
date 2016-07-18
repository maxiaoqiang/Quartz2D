//
//  DemoVC4.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC4.h"
#import "DrawView.h"

@implementation DemoVC4

-(void)viewDidLoad{
    [super viewDidLoad];
    DrawView *draw= [[DrawView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    draw.center = self.view.center;
    draw.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:draw];
}

@end
