//
//  StartView.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/5.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "StartView.h"

@implementation StartView

-(void)initUI{
    
    if (self.Controller != nil && self.Controller.navigationController ==nil ) {
        [self.Controller asRoot:RootViewNavigationType];
    }
    [self backgroundColor:MainHexColor];

    
    //logo
    [[[[self addImageView:@"logo" img:@"logo"]width:170 height:170]relate:Top v:146]toCenter:X];
    [[[self addLabel:@"title" text:@"IT连" font:36]onBottom:@"logo" y:20]toCenter:X];
    [[STLastLabel textColor:@"#FFFFFF"]textAlignment:NSTextAlignmentCenter];

    [[[[self addLabel:@"decLabel" text:@"只要技术好、对象、工作、money、" font:30 ]width:500 height:50] onBottom:@"title" y:30] toCenter:X];

    [[STLastLabel textColor:@"#FFFFFF"]textAlignment:NSTextAlignmentCenter];
    [[[[self addLabel:@"decLabel1" text:@"“随天”帮你找" font:30]width:500 height:50 ]onBottom:@"decLabel" y:0] toCenter: X];
    [[STLastLabel textColor:@"FFFFFF"]textAlignment:NSTextAlignmentCenter];

    
    //register btn
    [[[[self addButton:@"Register" title:nil font:30]width:287 height:77]onBottom:@"decLabel1" y:400]toCenter:X];
    [STLastButton backgroundImage:@"register_btn"];
    
    //LoginBtn
    [[[self addButton:@"Login" title:@"已有帐号,立即登录" font:24] onBottom:@"Register" y:50]toCenter:X];
    [[STLastButton titleColor:ColorWhite]backgroundColor:MainHexColor];
    
    
}
@end
