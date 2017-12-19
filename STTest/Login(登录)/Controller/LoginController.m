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
    
    self.view.backgroundColor = mainHexColor;
    
    UITextField *tf = self.UIList[@"UserName"];
    tf.delegate = self;
}

-(void)MainClick:(UIButton *)semder{
    NSLog(@"1111");
    NSMutableDictionary *para = [self formData];
    [para setValue:@"1" forKey:@"AccountType"];
    STMessageBox *box = [STMessageBox share];
    
    if (((UITextField *)self.UIList[@"UserName"]).text == nil||
        [((UITextField *)self.UIList[@"UserName"]).text isEqualToString:@""]){
        [self.box prompt:@"请输入帐号"];
        return;
    }
    
    if (((UITextField *)self.UIList[@"password"]).text ==nil ||
        [((UITextField *)self.UIList[@"password"]).text isEqualToString:@""]){
        [self.box prompt:@"请输入密码"];
        return;
    } 
    
}

-(void)backClick:(UIButton *)sender{
    StartController *vc = [[StartController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
}

-(void)ForgotPasswordClick:(UIButton *)sender{
    ForGotController *vc = [[ForGotController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
    
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (range.location > 10) {
        return NO;
    }else{
        return YES;
    }
}

@end
