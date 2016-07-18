//
//  DrawboardView.h
//  Quartz2D
//
//  ********************************
//  Created by 马晓强 on 16/6/24.
//  深圳泥巴装
//  ********************************

#import <UIKit/UIKit.h>

@interface DrawboardView : UIView

@property (nonatomic, strong) UIColor *pathColor;
@property (nonatomic, assign) NSInteger lineWidth;

@property (nonatomic, strong) UIImage *image;
//清屏
-(void)clear;
//撤销
-(void)undo;


@end
