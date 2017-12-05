//
//  TestView.m
//  IT恋
//
//  Created by 陈裕强 on 2017/6/8.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initUI
{
    [[self addTextView:nil] width:200 height:48 x:0 y:0];
    UIView* text= [[[self addTextView:nil] width:200 height:48] relate:Bottom v:0];
    
    UIView*p1= [[[[self addRectangle] width:1.0 height:0.3] relate:Top v:96] bgColor:ColorBlack];
    
    UIView* pv1= [[[[p1 addRectangle]  width:48 height:48] relate:LeftTopBottom v:48] bgColor:ColorBrown];
    UIView* pv2= [[[[p1 addRectangle]  width:48 height:48] relate:TopRightBottom v:48] bgColor:ColorYellow];
    
    
    [[[[[self.lastSubView addTextView:nil] bgColor:ColorBlue] width:48]
      onRight:pv1 x:48] onLeft:pv2 x:48] ;
    
    
    
    UIView* x=  [[[[self addRectangle] width:1.0 height:0.5] onTop:text y:0] bgColor:ColorRed];
    UIView* xp1= [[[[[x addRectangle]  width:48 height:48] relate:Top v:48] toCenter:X] bgColor:ColorBrown];
    UIView* xp2= [[[[[x addRectangle]  width:48 height:48] relate:Bottom v:48] toCenter:X] bgColor:ColorBrown];
    
    
    [[[[[[self.lastSubView addTextView:nil] bgColor:ColorBrown] width:48] toCenter:X]
      onBottom:xp1 y:48] onTop:xp2 y:48];
//
    
    //[[[self addTextView:nil] width:100 height:48] onTop:self.lastSubView.PreView y:0];
}
@end
