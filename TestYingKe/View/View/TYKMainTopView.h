//
//  TYKMainTopView.h
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopViewBlock)(NSInteger index);

@interface TYKMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr tapView:(MainTopViewBlock)block;

- (void)scrolling:(NSInteger)tag;

@end
