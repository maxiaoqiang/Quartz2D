//
//  DemoVC20.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC20.h"
#import "DrawLinePathView.h"


@interface DemoVC20 ()


@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation DemoVC20

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawLinePathView *drawLinePath = [[DrawLinePathView alloc] initWithFrame:self.view.frame];
    drawLinePath.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawLinePath];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"阿狸头像"];
    [drawLinePath addSubview:_imageView];
    
    
}



@end
