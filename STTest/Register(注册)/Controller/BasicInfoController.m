//
//  BasicInfoController.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "BasicInfoController.h"

@interface BasicInfoController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation BasicInfoController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本信息";
 
}

-(void)complete:(id *)sender{
    NSLog(@"按钮被点击了！");
 
}

-(void)headImage:(UIImageView *)sender{
    
    
    self.title = @"111111";
    [sender pick:^(NSData *data, UIImagePickerController *picker, NSDictionary<NSString *,id> *info) {
        [sender image:data];
    } edit:YES];

}

@end
