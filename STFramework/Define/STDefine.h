//
//  STDefineUrl.h
//  IT恋
//
//  Created by 陈裕强 on 2017/5/18.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#ifndef STDefine_h
#define STDefine_h

#pragma mark 函数

//将字符从大写转化成小写
#define CharLower(c)      ((c >= 'A' && c <= 'Z') ? (c | 0x20) : c)
//将字符从小写转化成大写
#define CharUpper(c)      ((c >= 'a' && c <= 'z') ? (c & ~0x20) : c)
//数字转字符串
#define toString(value)  ([NSString stringWithFormat: @"%ld", value]);

#pragma mark 颜色
#define ColorBlack [UIColor blackColor]      // 0.0 white
#define ColorBlue [UIColor blueColor]
#define ColorDarkGray [UIColor darkGrayColor]
#define ColorLightGray [UIColor lightGrayColor]
#define ColorWhite [UIColor whiteColor]
#define ColorGray [UIColor grayColor]
#define ColorRed [UIColor redColor]
#define ColorGreen [UIColor greenColor]
#define ColorCyan [UIColor cyanColor]
#define ColorYellow [UIColor yellowColor]
#define ColorMagenta [UIColor magentaColor]
#define ColorOrange [UIColor orangeColor]
#define ColorPurple [UIColor purpleColor]
#define ColorBrown [UIColor brownColor]
#define ColorClear [UIColor clearColor]
#define MainHexColor [UIColor hex:@"#41b198"]
#define LineColor [UIColor colorWithWhite:1.0 alpha:0.5]


#endif /* Constants_h */
