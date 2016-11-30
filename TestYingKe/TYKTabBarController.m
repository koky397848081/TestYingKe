//
//  TYKTabBarController.m
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "TYKTabBarController.h"

@interface TYKTabBarController ()
@property (weak, nonatomic) IBOutlet UITabBar *TYKtabBar;

@end

@implementation TYKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
  
 //   [[UITabBar appearance] setTintColor:[UIColor colorWithRed:67/255.0 green:220/255.0 blue:207/255.0 alpha:1]] ;  //可只用这个更改颜色，如果需要固定某个item的颜色（不论是否点击都不会有默认灰色），则需要用下面的方法设置点击和未点击颜色
    [UITabBar appearance].translucent = NO;//这句表示取消tabBar的透明效果。
    UITabBar *tabBar = _TYKtabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
   
    // 对item设置相应地图片
    item0.selectedImage = [[UIImage imageNamed:@"tab_live_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item0.image = [[UIImage imageNamed:@"tab_live"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item1.selectedImage = [[UIImage imageNamed:@"tab_phtot"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item1.image = [[UIImage imageNamed:@"tab_phtot"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"tab_me_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item2.image = [[UIImage imageNamed:@"tab_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

//下列方法设置点击按钮有大小变化,如果是自定义button ,则可以直接设置animation：button.transform = CGAffineTransformMakeScale(1.2, 1.2);由于UITabBarItem继承UITabBar－nsobject,可以使用下面方法设置
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if([item isEqual:_TYKtabBar.items[1]])
    {
        return;
    }
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
    
}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:1];
    pulse.toValue= [NSNumber numberWithFloat:1.2];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
}


@end
