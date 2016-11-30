//
//  TYKNavigationController.m
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "TYKNavigationController.h"

@interface TYKNavigationController ()

@end

@implementation TYKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;  //关闭渲染导致的颜色不正确

   
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置显示的颜色
    bar.barTintColor = [UIColor colorWithRed:67/255.0 green:200/255.0 blue:207/255.0 alpha:1];
    
    //设置字体颜色
    bar.tintColor = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor whiteColor],NSFontAttributeName :[UIFont boldSystemFontOfSize:22]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
