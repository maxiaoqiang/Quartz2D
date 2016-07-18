//
//  DemoVC0.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC0.h"
#import "View0.h"


@implementation DemoVC0

-(void)viewDidLoad{
    [super viewDidLoad];
    
    View0 *view0= [[View0 alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    view0.center = self.view.center;
    view0.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view0];
}

@end
