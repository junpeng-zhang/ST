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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = mainHexColor;
}

-(void)loginClick:(UIButton *)sender{
    LoginController *vc = [[LoginController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
    
}

-(void)registerClick:(UIButton *)sender{
    RegisterController *vc = [[RegisterController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
}




@end
