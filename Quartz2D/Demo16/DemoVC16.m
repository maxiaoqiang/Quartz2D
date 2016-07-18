//
//  DemoVC16.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC16.h"

@interface DemoVC16 ()

@end

@implementation DemoVC16

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建图层
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 100, 200, 200);
    layer.backgroundColor = [UIColor redColor].CGColor;
    //设置图层内容
    layer.contents =  (id)[UIImage imageNamed:@"阿狸头像"].CGImage;
    [self.view.layer addSublayer:layer];

}



@end
