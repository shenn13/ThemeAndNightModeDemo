//
//  UIColor+Color.m
//  ThemeAndNightMode
//
//  Created by shen on 17/4/17.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "UIColor+Color.h"

@implementation UIColor (Color)

+ (UIColor*)randomColor{
    return [UIColor colorWithHue:(arc4random() %256/256.0) saturation:(arc4random() %128/256.0) +0.5 brightness:(arc4random() %128/256.0) +0.5 alpha:1];
    
}

+ (UIColor *)colorWithHex:(NSInteger)hexColor {
    
    return [UIColor colorWithRed:((hexColor & 0xFF0000) >> 16)/255.0 green:((hexColor & 0x00FF00) >> 8) /255.0 blue:( hexColor & 0x0000FF)/255.0 alpha:1.0];
}


+(UIColor *)colorFromHexString:(NSString *)hexString {
    
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return [UIColor grayColor];
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return [UIColor grayColor];

    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


+ (UIColor *)colorWithNormalHexColor:(NSInteger)normalHexColor nightHexColor:(NSInteger)nightHexColor {
    
    NSString *styleStr = [[NSUserDefaults standardUserDefaults] objectForKey:kSkinStyle];
    
    if ([styleStr isEqualToString:@"night"]) {
        
        return [UIColor colorWithHex:nightHexColor];
    }
    return [UIColor colorWithHex:normalHexColor];
}

@end
