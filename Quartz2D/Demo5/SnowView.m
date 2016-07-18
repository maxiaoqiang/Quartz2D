//
//  SnowView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "SnowView.h"

static CGFloat _snowY = 0;
@implementation SnowView

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self awakeFromNib];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    //如果以后想绘制东西到view上面，必须在drawRect方法里面，不管有没有手动获取到上下文
    //修改雪花y值
    UIImage *image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointMake(50, _snowY)];
    _snowY += 10;
    if (_snowY > rect.size.height) {
        _snowY = 0;
    }
}

//创建定时器 NSTimer很少用于绘图，因为调度优先级比较少，并不会准时调用
-(void)awakeFromNib{
    //创建定时器
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    //添加主运行循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

-(void)timeChange{
    //注意：这个方法并不会马上调用drawRect，其实这个方法只是给当前控件添加标记，等下一次屏幕刷新的时候才会调用drawRect
    [self setNeedsDisplay];

}

@end
