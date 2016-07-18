//
//  DemoVC18.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC18.h"

#define kClockW  (_clockView.bounds.size.width)

#define angle2radion(a) ((a) / 180.0 * M_PI)

//一秒钟秒钟转6
#define perSecondA 6
//一分钟分钟转6
#define perMinuteA 6
//一小时时针转30
#define perHourA 30

//每分钟时针转0.5
#define perMinuteHourA 0.5


@interface DemoVC18 ()

@property (nonatomic, strong) UIImageView *clockView;

@property (nonatomic, strong) CALayer *secondLayer;
@property (nonatomic, strong) CALayer *minuteLayer;
@property (nonatomic, strong) CALayer *hourLayer;




@end

@implementation DemoVC18

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _clockView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _clockView.image = [UIImage imageNamed:@"钟表"];
    [self.view addSubview:_clockView];
    
    //添加时针
    [self setUpHourLayer];
    //添加分针
    [self setUpMinuteLayer];
    //添加秒针
    [self setUpSecondLayer];
    
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    [self timeChange];
}

-(void)timeChange{
    //获取当前的系统时间
    //获取当前日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取日期的组件:年月日时分秒
    //component:需要获取的日期组件
    //fromDate:获取哪个日期的组件
    //经验:枚举中有移位运算符，通常一般可以使用并运算(|)
    
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour fromDate:[NSDate date]];
    //获取秒
    NSInteger second = cmp.second;
    //获取分
    NSInteger minute = cmp.minute;
    //获取小时
    NSInteger hour = cmp.hour;
    
    //计算秒针转多少度
    CGFloat secondA = second * perSecondA;
    //计算分针转多少度
    CGFloat minuteA = minute * perMinuteA;
    //计算时针转多少
    CGFloat hourA = hour * perHourA + minute * perMinuteHourA;
    //旋转秒针
    _secondLayer.transform = CATransform3DMakeRotation(angle2radion(secondA), 0, 0, 1);
    //旋转分针
     _minuteLayer.transform = CATransform3DMakeRotation(angle2radion(minuteA), 0, 0, 1);
    //旋转秒针
     _hourLayer.transform = CATransform3DMakeRotation(angle2radion(hourA), 0, 0, 1);
    
}
#pragma mark--添加秒针
-(void)setUpSecondLayer{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    //设置锚点
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    layer.bounds  = CGRectMake(0, 0, 1, kClockW * 0.5 - 20);
    [_clockView.layer addSublayer:layer];
    
    _secondLayer = layer;
}
#pragma mark--添加分针
-(void)setUpMinuteLayer{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    //设置锚点
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    layer.bounds  = CGRectMake(0, 0, 4, kClockW * 0.5 - 30);
    [_clockView.layer addSublayer:layer];
    layer.cornerRadius = 4;
    _minuteLayer = layer;
}

#pragma mark--添加时针
-(void)setUpHourLayer{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    //设置锚点
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    layer.bounds  = CGRectMake(0, 0, 4, kClockW * 0.5 - 40);
    [_clockView.layer addSublayer:layer];
    layer.cornerRadius = 4;
    _hourLayer = layer;
}
@end
