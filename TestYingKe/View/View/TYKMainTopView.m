
//
//  TYKMainTopView.m
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "TYKMainTopView.h"

@interface TYKMainTopView()

@property (nonatomic, copy) MainTopViewBlock block;
@property (nonatomic, strong) NSMutableArray * buttons;
@property (nonatomic, strong) UIView * lineView;

@end

@implementation TYKMainTopView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr tapView:(MainTopViewBlock)block{
    self = [super initWithFrame:frame];
    if (self) {
        self.block = block;
        CGFloat btnW = self.frame.size.width / titleArr.count;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX;
       
        for (int i = 0; i <titleArr.count; i ++) {
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i;
         //   BUTTON_TITLE(titleBtn, titleArr[i]);
            NSString * vcName = titleArr[i];
            
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = FONT(18);
            btnX = i * btnW;
            titleBtn.frame = CGRectMake(btnX, 0, btnW, btnH);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
            [self.buttons addObject:titleBtn];
            
            if (i == 1) {
                // 添加下划线
                // 下划线宽度 = 按钮文字宽度
                // 下划线中心点x = 按钮中心点x
                
                CGFloat h = 2;
                CGFloat y = 35 ;
                
                // 先计算文字尺寸,在给label去赋值
                [titleBtn.titleLabel sizeToFit];
                
                UIView * lineView =[[UIView alloc] init];
                // 位置和尺寸
                lineView.height = h;
                lineView.width = titleBtn.titleLabel.width;
                lineView.centerX = titleBtn.centerX;
                lineView.top = y;
                lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView = lineView;
                
                [self addSubview:self.lineView];
                
            }
        }}
    return self;
}

- (void)titleClick:(UIButton *)button {
    
    self.block(button.tag);
    
    [self scrolling:button.tag];
}

- (void)scrolling:(NSInteger)tag {
    
    UIButton * button = self.buttons[tag];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineView.centerX = button.centerX;
    }];
}

#pragma mark
#pragma mark setter and getter

- (NSMutableArray *)buttons {
    
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
@end
