//
//  STDefineUI.h
//  IT恋
//
//  Created by 陈裕强 on 2017/5/18.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#ifndef STDefineUI_h
#define STDefineUI_h


//全屏 以IPhone6的像素为标准参考 750*1334

#define STScreenScale [UIScreen mainScreen].scale
#define STScreeWidthPt [UIScreen mainScreen].bounds.size.width
#define STScreeHeightPt [UIScreen mainScreen].bounds.size.height

#define STScreenWidthPx (STScreeWidthPt<STScreeHeightPt?750:1334)
#define STScreenHeightPx (STScreeWidthPt<STScreeHeightPt?1334:750)

//比例系数 750下的像素 px*比例像素，得到对应的pt
//特别说明，本系素不用能用于frame，因为frame不是标准
#define Xpt (STScreeWidthPt/STScreenWidthPx) // 1242/750
#define Ypt (STScreeHeightPt/STScreenHeightPx) //2208/1334

//Xpt*比例像素,得到对于750标准下的px(以便后续都是用750标准计算）
//特别说明，本系素不用能用于frame，因为frame不是标准
#define Xpx2 (STScreeWidthPt*STScreenScale*STScreenScale/750) // 1242/750
#define Ypx2 (STScreeWidthPt*STScreenScale*STScreenScale/1334) //2208/1334

#define Xpx (STScreenWidthPx/STScreeWidthPt) // 1242/750
#define Ypx (STScreenHeightPx/STScreeHeightPt) //2208/1334

//得到的是750下转换的像素
#define NavHeight 44.0f*Ypx
#define StatusBarHeight 20.0f*Ypx
#define ToolBarHeight 49.0f*Ypx

//750,1334        414,736 *3


//全屏
#define STFullRect [UIScreen mainScreen].bounds
#define STFullSize [UIScreen mainScreen].bounds.size
//空屏
#define STEmptyRect CGRectMake(0,0,0,0)

//#define STRectMake(x,y,width,height) CGRectMake(floor(x*Xpt),floor(y*Ypt),floor(width*Xpt),floor(height*Ypt))
//#define STSizeMake(width,height) CGSizeMake(floor(width*Xpt),floor(height*Ypt))
//#define STPointMake(x,y) CGPointMake(floor(x*Xpt),floor(y*Ypt))

#define STRectMake(x,y,width,height) CGRectMake(x*Xpt,y*Ypt,width*Xpt,height*Ypt)
#define STSizeMake(width,height) CGSizeMake(width*Xpt,height*Ypt)
#define STPointMake(x,y) CGPointMake(x*Xpt,y*Ypt)

//原始图片大小，不需要转
//#define UIEdgeInsetsMake(top, left, bottom, right) UIEdgeInsetsMake(top*Ypt, left*Xpt, bottom*Ypt, right*Xpt)
//(770,100)


#endif /* STDefineUI_h */
