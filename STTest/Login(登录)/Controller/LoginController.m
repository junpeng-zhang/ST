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

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"登录";
    
    self.view.backgroundColor = MainHexColor;

    
}

-(void)backClick:(UIButton *)sender{
    StartController *vc = [[StartController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
}

-(void)ForgotPasswordClick:(UIButton *)sender{
    ForGotController *vc = [[ForGotController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
}

@end
