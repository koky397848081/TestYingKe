//
//  TYKCommentConfig.h
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef DEBUG
# define ALog(fmt, ...) NSLog((@"[文件名:=>  %s]\n" "[函数名:=>  %s]\n" "[行号:=>  %d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define ALog(...);
#endif


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
 *  BackgroundImage, title of Button
 *
 */
#define BUTTON_TITLE(button,title) [button setTitle:title forState:UIControlStateNormal];
#define BUTTON_BG_IMG(button, imageName) [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
#define BUTTON_IMG(button, imageName) [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

/**
 *  Font and Color
 *
 */

#define FONT(R) [UIFont systemFontOfSize:R]

#define ColorWithRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define ColorWithOne(R) [UIColor colorWithRed:R/255.0 green:R/255.0 blue:R/255.0 alpha:1.0]

#define ColorWithRandom [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0] //随机颜色
#define  Color_clear [UIColor clearColor]

#define Font_Num(F) [UIFont systemFontOfSize:MIN(F*SCREEN_WIDTH/375.0,F)]


@interface TYKCommentConfig : NSObject

@end
