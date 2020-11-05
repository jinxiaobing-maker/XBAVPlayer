//
//  UIColor+Utils.h
//  Geely
//
//  自定义底部弹出框
//
//  Created by yangfan on 2017/6/25.
//  Copyright © 2017年 Geely. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  颜色扩展类别
 */
@interface UIColor (Utils)

/**
 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
 @param color 十六进制
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/**
 *  通过十六进制获取颜色
 *
 *  @param hexColor 十六进制
 *
 *  @return 颜色
 */
+ (UIColor *)colorForHex:(long)hexColor;

/**
 *  16进制和透明度获取颜色
 *
 *  @param hexColor 16进制
 *  @param alpha    透明度
 *
 *  @return 颜色
 */
+ (UIColor *)colorForHex:(long)hexColor Alpha:(CGFloat)alpha;

/**
 *  R.G.B获取颜色
 *
 *  @param red   红
 *  @param green 绿
 *  @param blue  蓝
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;

+ (UIColor *)colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue Alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

#pragma mark - 具体业务

+ (UIColor *)tabBarSelectTextColor;
+ (UIColor *)tabBarUnSelectTextColor;
+ (UIColor *)tabBarSelectLayerColor;

+ (UIColor *)placeholderColor;

/* 老的应用主题色，不做修改，还有模块在用 */
+ (UIColor *)navColor;

/* 自定义导航栏 Item 颜色 */
+ (UIColor *)navItemColor;

/* 自定义导航栏 Item 不可点击 颜色 */
+ (UIColor *)navItemDarkColor;

/* 自定义导航栏 Title 颜色 */
+ (UIColor *)navTitleColor;

/* 自定义导航栏 底部小黑线 颜色 */
+ (UIColor *)navLineColor;

@end
