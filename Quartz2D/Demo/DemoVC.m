//
//  DemoVC.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC.h"
#import "DemoCell.h"
#import "MxqGifHeader.h"

NSString *const demo0Description = @"layer-基本图形绘制";
NSString *const demo1Description = @"layer-下载进度圆环";
NSString *const demo2Description = @"layer-饼图";
NSString *const demo3Description = @"layer-柱状图";
NSString *const demo4Description = @"layer-绘制文字图片";
NSString *const demo5Description = @"layer-雪花飘飘";
NSString *const demo6Description = @"layer-图形上下文栈";
NSString *const demo7Description = @"layer-矩阵操作";
NSString *const demo8Description = @"位图-图片水印";
NSString *const demo9Description = @"位图-图片裁剪";
NSString *const demo10Description = @"位图-屏幕截屏";
NSString *const demo11Description = @"画板";
NSString *const demo12Description = @"QQ黏性效果";
NSString *const demo13Description = @"图片擦除";
NSString *const demo14Description = @"图片截取";
NSString *const demo15Description = @"CALayer基本使用";
NSString *const demo16Description = @"CALayer新建图层";
NSString *const demo17Description = @"CALayer隐式动画";
NSString *const demo18Description = @"时钟";
NSString *const demo19Description = @"核心动画－CABasicAnimation";
NSString *const demo20Description = @"核心动画－CAKeyframeAnimation";
NSString *const demo21Description = @"转场动画－CATransition";
NSString *const demo22Description = @"动画组－CAAnimationGroup";
NSString *const demo23Description = @"UIView和核心动画区别";
NSString *const demo24Description = @"转盘";
NSString *const demo25Description = @"粒子效果";



@interface DemoVC()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_contentArray;
}

@property (nonatomic, strong) UITableView *tableView;

@end
@implementation DemoVC


/**
 *
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.title = @"Quartz2D";
    self.tableView.mj_header = [MxqGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _contentArray = @[demo0Description,demo1Description,demo2Description,demo3Description,demo4Description,demo5Description,demo6Description,demo7Description,demo8Description,demo9Description,demo10Description,demo11Description,demo12Description,demo13Description,demo14Description,demo15Description,demo16Description,demo17Description,demo18Description,demo19Description,demo20Description,demo21Description,demo22Description,demo23Description,demo24Description,demo25Description];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    });
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contentArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"CELL";
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.titleLabel.text = [NSString stringWithFormat:@"demo-- %ld",indexPath.row];
    cell.contentLabel.text = [NSString stringWithFormat:@"%@",_contentArray[indexPath.row]];
    cell.backgroundColor = [UIColor orangeColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *demoClassString = [NSString stringWithFormat:@"DemoVC%ld",indexPath.row];
    UIViewController *vc = [NSClassFromString(demoClassString) new];
    vc.title = demoClassString;
    [self.navigationController pushViewController:vc animated:YES];
}


@end