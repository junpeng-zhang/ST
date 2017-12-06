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
    //logo
    UIImageView *logo                   = [[[[self addImageView:@"logo"] width:170 height:170] relate:Top v:72] toCenter:X];
    
    //mobile textfiled
    UIImageView *moblieImageView        = [[[self addImageView:@"icon_phone"] width:48 height:48]onBottom:logo y:132 x:-148];
    UITextField *mobileTF               = [[[self addTextField:@"username" placeholder:@"手机号码"]width:372 height:68] onRight:moblieImageView x:30 y:-10];
    mobileTF.keyboardType               = UIKeyboardTypeNumberPad;
    UIView *mobileLineView              = [[[self addLine:LineColor] width:450 height:2] onBottom:moblieImageView y:30];
    
    //password textfiled
    UIImageView *passwordImageView      = [[[self addImageView:@"icon_password"] width:48 height:48] onBottom:mobileLineView y:30];
    UITextField *passwordTF             = [[[self addTextField:@"password" placeholder:@"密码"] width:372 height:68] onRight:passwordImageView x:30 y: -10];
    passwordTF.secureTextEntry          = YES;
    passwordTF.keyboardType             = UIKeyboardTypeNumbersAndPunctuation;
    UIView      *passwordLine           = [[[self addLine:LineColor] width:450 height:2] onBottom:passwordImageView y:30];
    
    //forgotPasswordBTN
    UIButton *ForgotPasswordBtn         = [[[self addButton:@"ForgotPassword" title:@"忘记密码"] width:150 height:29] onBottom:passwordLine y:20 x:320];
    [ForgotPasswordBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    
    //login btn
    UIButton *loginButton               = [[[self addButton:@"Main" title:@"登录"] width:450 height:80] onBottom:passwordLine y:149];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"registered_button_default"] forState:UIControlStateNormal];
    [loginButton setTitleColor:MainHexColor forState:UIControlStateNormal];
    loginButton.adjustsImageWhenHighlighted = NO;
    
    //返回
    UIButton *backBtn =[[[self addButton:@"back"]width:48 height:48] x:20 y:50];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
    
    
    
    
    
}

@end
