//
//  DemoVC7.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC7.h"
#import "RectView.h"

@implementation DemoVC7

-(void)viewDidLoad{
    [super viewDidLoad];
    RectView *rect= [[RectView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    rect.center = self.view.center;
    rect.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:rect];
    
}


@end
