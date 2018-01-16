//
//  MainController.m
//  STTest
//
//  Created by 张俊鹏 on 2018/1/9.
//  Copyright © 2018年 Leslie Cheung. All rights reserved.
//



@interface MainController : STTabController

@end

@implementation MainController

-(void)onInit{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];//Start中字颜色为黑,这里改白
    [[[[[UINavigationBar globalSetting] tintColor:ColorWhite] titleTextAttributes:@{NSForegroundColorAttributeName : ColorWhite}]
      translucent:NO] backgroundImage:nil stretch:YES];
}

-(void)initUI{
    
    
//    UINavigationController *one   = [[[[STNew(@"One")   tabTitle:@"1"] tabImage:@"tab_icon1"] tabSelectedImage:@"tab_icon1pre" ]toUINavigationController];
    
    UINavigationController *two   = [[[[STNew(@"Two")   tabTitle:@"2"] tabImage:@"tab_icon2"] tabSelectedImage:@"tab_icon2pre" ]toUINavigationController];
    
    UINavigationController *three = [[[[STNew(@"Three") tabTitle:@"3"] tabImage:@"tab_icon3"] tabSelectedImage:@"tab_icon3pre" ]toUINavigationController];
    
    UINavigationController *four  = [[[[STNew(@"Four")  tabTitle:@"4"] tabImage:@"tab_icon4"] tabSelectedImage:@"tab_icon4pre" ]toUINavigationController];
    
    self.viewControllers = @[two,three,four];
}

-(void)initData{
    
}

@end
