//
//  ForGotView.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "ForGotView.h"

@implementation ForGotView

-(void)initUI{
    //logo
    UIImageView *logo                   = [[[[self addImageView:@"logo"] width:170 height:170] relate:Top v:72] toCenter:X];
    
    //mobile textfiled
    UIImageView *moblieImageView        = [[[self addImageView:@"icon_phone"] width:48 height:48]onBottom:logo y:132 x:-148];
    UITextField *mobileTF               = [[[self addTextField:@"username" placeholder:@"手机号码"]width:372 height:68] onRight:moblieImageView x:30 y:-10];
    mobileTF.keyboardType               = UIKeyboardTypeNumberPad;
    UIView *mobileLineView              = [[[self addLine:@"mobileLineView" color:ColorRed] width:450 height:2] onBottom:moblieImageView y:30];
    
    //password textfiled
    UIImageView *passwordImageView      = [[[self addImageView:@"icon_password"] width:48 height:48] onBottom:mobileLineView y:30];
    UITextField *newPasswordTF          = [[[self addTextField:@"newPassword" placeholder:@"新密码"] width:372 height:68] onRight:passwordImageView x:30 y: -10];
    newPasswordTF.secureTextEntry       = YES;
    newPasswordTF.keyboardType          = UIKeyboardTypeNumbersAndPunctuation;
    UIView      *passwordLine           = [[[self addLine:@"passwordLine" color:ColorRed] width:450 height:2] onBottom:passwordImageView y:30];
    
    //verification textfiled
    UIImageView *verificationImageView  = [[[self addImageView:@"icon_verification"]width:48 height:48] onBottom:passwordLine y:30];
    UITextField *verificationTF         = [[[self addTextField:@"verificationTF"] width:240 height:68]onRight:verificationImageView x:30 y:-10];
    UIView      *verificationLine       = [[[self addLine:@"verificationLine" color:ColorRed] width:450 height:2] onBottom:verificationImageView y:30];
    UIButton    *verificationBtn        = [[[self addButton:@"verificationBtn" title:@"验证码"]width:132 height:60] onRight:verificationTF x:0 y:10];
    [verificationBtn setBackgroundImage:[UIImage imageNamed:@"verification"] forState:UIControlStateNormal];
    verificationBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    
    
    
    //complete btn
    UIButton *completeButton               = [[[self addButton:@"complete" title:@"完成"] width:450 height:80] onBottom:passwordLine y:169];
    [completeButton setBackgroundImage:[UIImage imageNamed:@"registered_button_default"] forState:UIControlStateNormal];
    [completeButton setTitleColor:mainHexColor forState:UIControlStateNormal];
     completeButton.adjustsImageWhenHighlighted = NO;
    
    //返回
    UIButton *backBtn =[[[self addButton:@"back"]width:48 height:48] x:20 y:50];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
}

@end
