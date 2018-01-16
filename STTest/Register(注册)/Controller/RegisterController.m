//
//  RegisterController.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "RegisterController.h"
#import "StartController.h"
#import "BasicInfoController.h"

@interface RegisterController ()<UITextFieldDelegate>


@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    
}


-(void)BasicInfoClick:(id *)sender{

    if(!  [self isMatch:@"手机号" name:@"username" regex:nil] || ![self isMatch:@"密码" name:@"newPassword" regex:nil])
    {
        return;

    }
    
    [self stPush:[BasicInfoController new] title:nil img:@"left_arrow"];

}

-(void)verificationClick:(UIButton *)sender{
    [STButton(@"verificationBtn") showTime:60];
    NSLog(@"11111--------111111");
    
}



@end
