//
//  LoginView.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/5.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

-(void)initUI{
    [self backgroundColor:MainHexColor];
    //logo
    [[[[self addImageView:@"logo" img:@"logo"] width:170 height:170] relate:Top v:72] toCenter:X];
    
    
    //mobile textfiled
    [[[self addImageView:@"icon_phone" img:@"icon_phone"] width:48 height:48]onBottom:@"logo" y:132 x:-148];
    [[[self addTextField:@"UserName" placeholder:@"手机号码"]width:372 height:68] onRight:@"icon_phone" x:30 y:-10];
    [STLastTextField keyboardType:UIKeyboardTypeNumberPad];
    [[[self addLine:@"Line" color:LineColor]width:450 height:2]onBottom:@"icon_phone" y:30];
    
    
    //password textfiled
    [[[self addImageView:@"icon_password" img:@"icon_password"] width:48 height:48] onBottom:@"Line" y:30];
    [[[self addTextField:@"password" placeholder:@"密码"] width:372 height:68] onRight:@"icon_password" x:30 y: -10];
    [[STLastTextField keyboardType:UIKeyboardTypeNumbersAndPunctuation]secureTextEntry:YES];
    [[[self addLine:@"passwordLine" color:LineColor] width:450 height:2] onBottom:@"icon_password" y:30];
    
    //forgotPasswordBTN
    [[[self addButton:@"ForgotPassword" title:@"忘记密码" font:30] width:150 height:29] onBottom:@"passwordLine" y:20 x:320];
    
    //login btn
    [[[self addButton:@"Main" title:@"登录"] width:450 height:80] onBottom:@"passwordLine" y:100];
    [[[STLastButton backgroundImage:@"registered_button_default" forState:UIControlStateNormal]titleColor:MainHexColor]adjustsImageWhenHighlighted:NO];
    
    
}

@end
