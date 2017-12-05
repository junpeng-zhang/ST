//
//  Header.h
//  IT恋
//
//  Created by 陈裕强 on 2017/5/24.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#ifndef STEnum_h
#define STEnum_h
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,RootViewControllerType)  {
    RootViewDefaultType,
    RootViewNavigationType,
    RootViewTabBarType
};

typedef NS_ENUM(NSUInteger,XYFlag)  {
    XY=0,
    X=1,
    Y=2
};
typedef NS_ENUM(NSUInteger,XYLocation)  {
    Left,
    LeftTop,
    LeftTopRight,
    LeftTopBottom,
    LeftRight,
    LeftBottom,
    LeftBottomRight,
    
    Top,
    TopRight,
    TopBottom,
    TopRightBottom,
    
    Right,
    RightBottom,
    
    Bottom,
    //相对四边
    LeftTopRightBottom
};

#endif /* Header_h */
