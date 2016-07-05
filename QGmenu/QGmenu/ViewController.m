//
//  ViewController.m
//  QGmenu
//
//  Created by Strong on 16/7/5.
//  Copyright © 2016年 strong. All rights reserved.
//

#import "ViewController.h"
#import "qgTableViewController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate>
/**控制器*/
@property (strong, nonatomic) qgTableViewController *itemPopVC;
@property (nonatomic, strong) NSDictionary *dataDic;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style: UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    self.navigationItem.rightBarButtonItem = right;
    
}

//使用key来保存文字与图片
- (NSDictionary *)dataDic {
    if (!_dataDic) {
        _dataDic = @{
                     @"扫一扫":[UIImage imageNamed:@"right_menu_QR"],
                     @"加好友":[UIImage imageNamed:@"right_menu_addFri"],
                     @"创建讨论组":[UIImage imageNamed:@"right_menu_multichat"],
                     @"发送到电脑":[UIImage imageNamed:@"right_menu_sendFile"],
                     @"面对面快传":[UIImage imageNamed:@"right_menu_facetoface"],
                     @"收钱":[UIImage imageNamed:@"right_menu_payMoney"]
                     };
    }
    return _dataDic;
}
-(void)rightBarAction
{
    
    self.itemPopVC = [[qgTableViewController alloc] init];
    self.itemPopVC.dataDic = self.dataDic;
    self.itemPopVC.modalPresentationStyle = UIModalPresentationPopover;
    self.itemPopVC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    //箭头方向
    self.itemPopVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //代理
    self.itemPopVC.popoverPresentationController.delegate = self;
    [self presentViewController:self.itemPopVC animated:YES completion:nil];
    
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    //设置iphone也可以使用
    return  UIModalPresentationNone;
}
@end
