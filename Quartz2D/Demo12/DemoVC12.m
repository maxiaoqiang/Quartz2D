//
//  DemoVC12.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/25.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC12.h"
#import "GooVIew.h"


@interface DemoVC12 ()

@end

@implementation DemoVC12

- (void)viewDidLoad {
    [super viewDidLoad];
    GooVIew *redDot= [[GooVIew alloc] initWithFrame:CGRectMake(100, 250, 20, 20)];
    [redDot setTitle:@"10" forState:UIControlStateNormal];
    
    [self.view addSubview: redDot.smallCircleView];
    [self.view addSubview:redDot];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
