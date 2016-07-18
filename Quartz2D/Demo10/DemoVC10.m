//
//  DemoVC10.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/24.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC10.h"
#import "UIImage+Addition.h"

@implementation DemoVC10

-(void)viewDidLoad{
    [super viewDidLoad];
    

    self.view.backgroundColor = [UIColor purpleColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.text = @"小强";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40 weight:40];
    [self.view addSubview:label];
    
    
    UIImage *image = [UIImage imageWithCaputureView:self.view];
    //image转data
    //<#CGFloat compressionQuality#> 图片质量 1:最高质量
    NSData *data = UIImageJPEGRepresentation(image, 1);
    [data writeToFile:@"/Users/shenzhenshinibazhuangwangluokejiyouxiangongsi/Desktop/XQ.png" atomically:YES];
    
}
@end
