//
//  StartController.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/5.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "StartController.h"
#import "LoginController.h"
#import "RegisterController.h"

@interface StartController ()

@end

@implementation StartController


-(void)initUI{
    [self needNavBar:NO setNavBar:YES];
}

-(void)LoginClick:(UIButton *)sender{
    [self stPush:[LoginController new] title:nil img:@"left_arrow"];
}

-(void)RegisterClick:(UIButton *)sender{
    [self stPush:[RegisterController new] title:nil img:@"left_arrow"];
}







@end
