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
    self.view.backgroundColor = mainHexColor;
    self.title = @"注册";
    [self asRoot:RootViewNavigationType];
    
    UITextField *tf = self.UIList[@"useranme"];
    tf.delegate = self;
    
    
}

-(void)nextClick:(UIButton *)sender{
    NSMutableDictionary *para = [self formData];
    STMessageBox *box = [STMessageBox share];
    if (((UITextField *)self.UIList[@"username"]).text == nil || [((UITextField *)self.UIList[@"username"]).text isEqualToString:@""]) {
        [self.box prompt:@"请输入手机号码"];
        return;
    }
    
    if (((UITextField *)self.UIList[@"newPassword"]).text == nil || [((UITextField *)self.UIList[@"newPassword"]).text isEqualToString:@""]) {
        [self.box prompt:@"请输入新的密码"];
        return;
    }
    
}

-(void)backClick:(UIButton *)sender{
    StartController *vc = [[StartController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
    
    
}



@end
