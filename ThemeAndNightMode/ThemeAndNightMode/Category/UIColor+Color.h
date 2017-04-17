//
//  UIColor+Color.h
//  ThemeAndNightMode
//
//  Created by shen on 17/4/17.
//  Copyright © 2017年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Color)

/**
 *  随机色
 */
+ (UIColor*)randomColor;


/**
 *  返回16进制色值对应的UIColor
 *  例如 [UIColor colorFromHex:0xffffff] 的返回值相当于 [UIColor whiteColor]
 *  @param hexColor color的16进制表示，需要0x前缀，例如0x66ccff
 *  @return 16进制表示法对应的UIColor
 */

+ (UIColor *)colorWithHex:(NSInteger)hexColor;

+(UIColor *)colorFromHexString:(NSString *)hexString;

/** 
 *   不同模式返回的颜色
 */
+ (UIColor *)colorWithNormalHexColor:(NSInteger)normalHexColor nightHexColor:(NSInteger)nightHexColor;

@end
