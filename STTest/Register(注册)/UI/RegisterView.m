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
    //logo
                                          [[[[self addImageView:@"logo" imgName:@"logo"] width:170 height:170] relate:Top v:146] toCenter:X];
    
    //mobile textfiled
    UIImageView *moblieImageView        = [[[self addImageView:nil imgName:@"icon_phone"] width:48 height:48]onBottom:@"logo" y:132 x:-148];
    UITextField *mobileTF               = [[[self addTextField:@"username" placeholder:@"手机号码"]width:372 height:68] onRight:moblieImageView x:30 y:-10];
    mobileTF.keyboardType               = UIKeyboardTypeNumberPad;
    UIView *mobileLineView              = [[[self addLine:@"mobileLineView" color:ColorRed] width:450 height:2] onBottom:moblieImageView y:30];
    
    //password textfiled
    UIImageView *passwordImageView      = [[[self addImageView:nil imgName:@"icon_password"] width:48 height:48] onBottom:mobileLineView y:30];
    UITextField *PasswordTF          = [[[self addTextField:@"newPassword" placeholder:@"设置密码"] width:372 height:68] onRight:passwordImageView x:30 y: -10];
    PasswordTF.secureTextEntry       = YES;
    PasswordTF.keyboardType          = UIKeyboardTypeNumbersAndPunctuation;
    UIView      *passwordLine           = [[[self addLine:@"passwordLine" color:ColorRed] width:450 height:2] onBottom:passwordImageView y:30];
    
    //verification textfiled
    UIImageView *verificationImageView  = [[[self addImageView:nil imgName:@"icon_verification"]width:48 height:48] onBottom:passwordLine y:30];
    UITextField *verificationTF         = [[[self addTextField:@"verificationTF"] width:240 height:68]onRight:verificationImageView x:30 y:-10];
    UIView      *verificationLine       = [[[self addLine:@"verificationLine" color:ColorRed] width:450 height:2] onBottom:verificationImageView y:30];
    UIButton    *verificationBtn        = [[[self addButton:@"verificationBtn" title:@"验证码"]width:132 height:60] onRight:verificationTF x:0 y:10];
    [verificationBtn setBackgroundImage:[UIImage imageNamed:@"verification"] forState:UIControlStateNormal];
    verificationBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    
    
    
    //complete btn
    UIButton *nextButton               = [[[self addButton:@"next" title:@"下一步"] width:450 height:80] onBottom:passwordLine y:169];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"registered_button_default"] forState:UIControlStateNormal];
    [nextButton setTitleColor:mainHexColor forState:UIControlStateNormal];
    nextButton.adjustsImageWhenHighlighted = NO;
    
    //返回
    UIButton *backBtn =[[[self addButton:@"back"]width:48 height:48] x:7 y:14 ];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
}

@end
