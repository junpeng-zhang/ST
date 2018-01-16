//
//  WelcomeController.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/27.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "WelcomeController.h"

@interface WelcomeController ()

@end

@implementation WelcomeController


-(void)onInit{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES ];
    [[[[[[UINavigationBar globalSetting]barTintColor:MainHexColor]tintColor:ColorWhite]backgroundImage:nil]shadowImage:nil]
     titleTextAttributes:@{NSForegroundColorAttributeName:ColorWhite}];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initUI{
//    STView *this = self.stView;
    
    [[sagit addScrollView:nil direction:X img:@"welcome_1",@"welcome_2",@"welcome_3", nil].lastSubView addClick:@"Main"];
    
    
    
    
//    [this needNavBar:NO setNavBar:YES];
    [self needNavBar:NO setNavBar:YES];
    
}

@end
