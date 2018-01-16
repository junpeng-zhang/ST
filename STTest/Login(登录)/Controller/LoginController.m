//
//  LoginViewController.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/5.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "LoginController.h"
#import "StartController.h"
#import "ForGotController.h"

@interface LoginController ()<UITextFieldDelegate>

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
}

-(void)MainClick:(id *)sender{

//    if (![self isMatch:@"手机号" Name:@"UserName"]
//        ||! [self isMatch:@"密码" Name:@"password"]) {
//        return;
//    }
    if (![self isMatch:@"手机号" name:@"UserName"] || ! [self isMatch:@"密码" name:@"password"]) {
        return;
    }

    
    
//    [self stPush:[StartController new] title:nil imgName:@"left_arrow"];
    [self stPush:[StartController new] title:nil img:@"left_arrow"];
    
}

-(void)ForgotPasswordClick:(UIButton *)sender{

    [self stPush:[ForGotController new] title:nil img:@"left_arrow"];
    
    
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (range.location > 10) {
        return NO;
    }else{
        return YES;
    }
}

@end
