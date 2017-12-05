//
//  STLayoutTracer.h
//  IT恋
//
//  Created by 陈裕强 on 2017/6/9.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "STEnum.h"

@interface STLayoutTracer : NSObject
@property (nonatomic, weak) UIView* view;
@property (nonatomic,assign) XYLocation location;
@property (nonatomic,assign) XYFlag xyFlag;
@property (nonatomic,assign) CGFloat v1;
@property (nonatomic,assign) CGFloat v2;
@property (nonatomic,assign) CGFloat v3;
@property (nonatomic,assign) CGFloat v4;
@end
