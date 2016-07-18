//
//  DemoCell.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width


@implementation DemoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kWidth - 20, 20)];
        [self.contentView addSubview:self.titleLabel];
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, kWidth - 20, 20)];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

@end
