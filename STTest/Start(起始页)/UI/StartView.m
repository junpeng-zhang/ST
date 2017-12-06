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
    //logo
    UIImageView *logo = [[[[self addImageView:@"logo"] width:170 height:170] relate:Top v:180] toCenter: X];
    //Label
    UILabel *titleLabel = [[[self addLabel:@"IT"]  onBottom:logo y:-40] toCenter:X];
    [titleLabel setFont:[UIFont systemFontOfSize:24]];
    titleLabel.tintColor = ColorWhite;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UILabel *decLabel = [[[[self addLabel:@"只要技术好、对象、工作、money、"]width:500 height:50] onBottom:titleLabel y:-20] toCenter:X];
    [decLabel setFont:[UIFont systemFontOfSize:18]];
    decLabel.tintColor = ColorWhite;
    [decLabel sizeToFit];
    UILabel *decLabel1 = [[[[self addLabel:@"“随天”帮你找"]width:500 height:50]onBottom:decLabel y:10] toCenter: X];
    [decLabel1 setFont:[UIFont systemFontOfSize:18]];
    decLabel1.textAlignment = NSTextAlignmentCenter;
    //Label颜色
    [titleLabel setTextColor:ColorWhite];
    [decLabel setTextColor:ColorWhite];
    [decLabel1 setTextColor:ColorWhite];
    
    //register btn
    UIButton *registerBtn = [[[[self addButton:@"register" title:@"立即注册"]width:287 height:77]onBottom:decLabel1 y:400]toCenter:X];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"register_btn"] forState:UIControlStateNormal];
    [registerBtn setTitleColor:MainHexColor forState:UIControlStateNormal];
    
    //LoginBtn
    UIButton *loginBtn = [[[self addButton:@"login" title:@"已有帐号,立即登录"] onBottom:registerBtn y:50]toCenter:X];
    [loginBtn setBackgroundColor:MainHexColor];
    [loginBtn setTitleColor:ColorWhite forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
  
    
}
@end
