//
//  BarView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "BarView.h"

@implementation BarView
-(NSArray *)arrRandom{
    int total = 100;
    NSMutableArray *arrM = [NSMutableArray array];
    int temp = 0;
    for (int i = 0; i < arc4random_uniform(10) + 1; i++) {
        //1~100
        //随机出来的临时值等于总值，直接退出循环，因为已经把总数分配完毕，没有必要再分配
        temp = arc4random_uniform(total) + 1;
        [arrM addObject:@(temp)];
        //解决方式:当随机出来的数等于总数直接退出循环
        if (temp == total) {
            break;
        }
        total -= temp;
    }
    
    //循环完毕之后，仍有剩余的值
    if (total) {
        [arrM addObject:@(total)];
    }
    return arrM;
}

-(UIColor *)colorrandom{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    NSArray *arr = [self arrRandom];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    for (int i = 0; i < arr.count; i ++) {
        w = rect.size.width / (2 * arr.count - 1);
        x = 2 * w * i;
        h = [arr[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, w, h) cornerRadius:1];
        [[self colorrandom] set];
        [path fill];
    }
    
}



@end
