//
//  DemoVC11.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/24.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC11.h"
#import "DrawboardView.h"

@interface DemoVC11 ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet DrawboardView *drawboardView;

@end

@implementation DemoVC11

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark-清屏
- (IBAction)clear:(id)sender {
    [_drawboardView clear];
}
#pragma mark-撤销
- (IBAction)undo:(id)sender {
    [_drawboardView undo];
}

#pragma mark-橡皮擦
- (IBAction)eraser:(id)sender {
    _drawboardView.pathColor = [UIColor whiteColor];
}

#pragma mark--选择图片
- (IBAction)pickerPhoto:(id)sender {
    //弹出系统的相册
    //选择控制器(系统相册)
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:NO completion:nil];

    
}

#pragma mark--UIImagePickerControllerDelegate
//当用户选择一张图片的时候调用
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取选中的照片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //把选中的照片画到画板上
    _drawboardView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark-保存
- (IBAction)save:(id)sender {
    
    //截屏
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(_drawboardView.bounds.size, NO, 0);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //渲染图层
    [_drawboardView.layer renderInContext:ctx];
    //获取上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //保存画板的内容放入相册
    /**
     *  @param image#>             写入的图片
     *  @param completionTarget#>   图片保存监听者
     *  注意：以后写入相册方法中，想要监听图片有没有保存成功，保存完成的方法不能随便写
     */
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

// 监听保存完成，必须实现这个方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"保存图片成功");
}- (IBAction)valueChange:(UISlider *)sender {
    
    //给画板传递线宽
    _drawboardView.lineWidth = sender.value;
    
}
- (IBAction)colorChange:(UIButton *)sender {
    _drawboardView.pathColor = sender.backgroundColor;
}

@end
