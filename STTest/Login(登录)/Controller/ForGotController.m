//
//  ForGotController.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "ForGotController.h"
#import "StartController.h"
@interface ForGotController ()

@end

@implementation ForGotController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = mainHexColor;
}


-(void)backClick:(UIButton *)sender{
    StartController *vc = [[StartController alloc]init];
    [self presentViewController:vc animated:true completion:nil];
}

@end
