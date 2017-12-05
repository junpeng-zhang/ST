//
//  STCategoryOtherView.m
//  IT恋
//
//  Created by 陈裕强 on 2017/6/8.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import "STUITextView.h"

#import "objc/runtime.h"

@interface UITextView()
@property (nonatomic,assign) CGFloat MaxHeight;
@end

@implementation UITextView(ST)
static char maxHeightChar='n';
- (CGFloat)MaxHeight{
    return [objc_getAssociatedObject(self, &maxHeightChar) floatValue];
}
- (UITextView*)setMaxHeight:(CGFloat)pxValue{
    objc_setAssociatedObject(self, &maxHeightChar, [@(pxValue) stringValue],OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}
@end
