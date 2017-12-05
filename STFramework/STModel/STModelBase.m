//
//  STModelBase.m
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import "STModelBase.h"

@implementation STModelBase

//默认全部可选。
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
