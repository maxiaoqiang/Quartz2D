//
//  DemoVC6.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC6.h"
#import "StackView.h"

@implementation DemoVC6

-(void)viewDidLoad{
    [super viewDidLoad];
    StackView *stack= [[StackView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    stack.center = self.view.center;
    stack.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:stack];
    
}

@end
