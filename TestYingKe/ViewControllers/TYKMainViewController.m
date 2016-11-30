//
//  TYKMainViewController.m
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "TYKMainViewController.h"
#import "TYKFocusTableViewController.h"
#import "TYKHotTableViewController.h"
#import "TYKNearViewController.h"
#import "TYKMainTopView.h"

@interface TYKMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray * titleNames;
@property (nonatomic, strong) TYKMainTopView * topView;

@end

@implementation TYKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildControllers];
    _contentScrollView.pagingEnabled = YES;
    self.navigationItem.titleView = self.topView;
}

- (void)setupChildControllers {
    
    NSArray * vcNames = @[@"TYKFocusTableViewController",@"TYKHotTableViewController",@"TYKNearViewController"];
    
    for (NSInteger i = 0 ; i < vcNames.count; i ++) {
        
        UIViewController * liveVC = [[NSClassFromString(vcNames[i]) alloc] init];
       // liveVC.view.frame  = CGRectMake(i *SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44);
        liveVC.title = self.titleNames[i];
        [self addChildViewController:liveVC];
    }
    
    self.contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * self.titleNames.count, 0);
    
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    CGFloat width = self.view.frame.size.width;
    
    CGFloat height = SCREEN_HEIGHT -64-44;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //获取索引
    NSInteger index = offsetX / width;
    
    //标题线
    [self.topView scrolling:index];
    
    UIViewController * childVC = self.childViewControllers[index];
    
    //视图控制器是否加载过
    if ([childVC isViewLoaded]){
        return;
    }
    
    childVC.view.frame = CGRectMake(offsetX, 0, width, height);
    //ALog(@"childVC.view.width----------------------->%lf",childVC.view.width);
    [scrollView addSubview:childVC.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark
#pragma mark setter and getter
- (NSArray *)titleNames {
    
    if (!_titleNames) {
        _titleNames = @[@"关注",@"热门",@"附近"];
    }
    return _titleNames;
}

- (TYKMainTopView *)topView {
    
    if (!_topView) {
        
        _topView = [[TYKMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 40) titleArr:self.titleNames tapView:^(NSInteger index) {
          
            CGPoint point = CGPointMake(index * SCREEN_WIDTH ,self.contentScrollView.contentOffset.y);
            
            [self.contentScrollView setContentOffset:point animated:YES];
            
        }];
       
    }
    return _topView;
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
