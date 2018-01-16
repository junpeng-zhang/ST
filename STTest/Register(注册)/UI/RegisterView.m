//
//  RegisterView.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView


-(void)initUI{
    [self backgroundColor:MainHexColor];
    //logo
    [[[[self addImageView:@"logo" img:@"logo"] width:170 height:170] relate:Top v:72] toCenter:X];
    
    //mobile textfiled
    [[[self addImageView:@"icon_phone" img:@"icon_phone"] width:48 height:48]onBottom:@"logo" y:132 x:-148];
    [[[self addTextField:@"username" placeholder:@"手机号码"]width:372 height:68] onRight:@"icon_phone" x:30 y:-10];
    [STLastTextField keyboardType:UIKeyboardTypeNumberPad];
    [[[self addLine:@"mobileLineView" color:ColorWhite] width:450 height:2] onBottom:@"icon_phone" y:30];
    
    //password textfiled
    [[[self addImageView:@"icon_password" img:@"icon_password"] width:48 height:48] onBottom:@"mobileLineView" y:30];
    [[[self addTextField:@"newPassword" placeholder:@"设置密码" ] width:372 height:68] onRight:@"icon_password" x:30 y: -10];
    [[STLastTextField secureTextEntry:YES]keyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [[[self addLine:@"passwordLine" color:ColorWhite] width:450 height:2] onBottom:@"icon_password" y:30];
    
    //verification textfiled
    [[[self addImageView:@"icon_verification" img:@"icon_verification"]width:48 height:48] onBottom:@"passwordLine" y:30];
    [[[self addTextField:@"verificationTF"] width:240 height:68]onRight:@"icon_verification" x:30 y:-10];
    [[[self addLine:@"verificationLine" color:ColorWhite] width:450 height:2] onBottom:@"icon_verification" y:30];
    [[[[self addButton:@"verificationBtn" title:@"验证码" font:30]width:132 height:60] onRight:@"verificationTF" x:0 y:10]addClick:@"verification"] ;
    [STLastButton backgroundImage:@"verification"];
   
    //complete btn
    [[[self addButton:@"BasicInfo" title:@"下一步"] width:450 height:80] onBottom:@"passwordLine" y:169];
    [[[[STLastButton backgroundImage:@"registered_button_default"]titleColor:MainHexColor]adjustsImageWhenHighlighted:NO]key:@"NavLeftImage" value:@"left_arrow"];
    
}

@end
