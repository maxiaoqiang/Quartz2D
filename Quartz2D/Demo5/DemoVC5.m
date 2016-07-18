//
//  DemoVC5.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC5.h"
#import "SnowView.h"

@implementation DemoVC5

-(void)viewDidLoad{
    [super viewDidLoad];
    SnowView *snow= [[SnowView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    snow.center = self.view.center;
    snow.backgroundColor = [UIColor blackColor];
    [self.view addSubview:snow];
}

@end
