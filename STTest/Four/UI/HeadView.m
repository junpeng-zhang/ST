//
//  HeadView.m
//  STTest
//
//  Created by 张俊鹏 on 2018/1/16.
//  Copyright © 2018年 Leslie Cheung. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

-(void)initUI{
    [sagit backgroundColor:ColorBlue];
    [sagit width:1 height:260 ];
    [[[sagit addImageView:nil img:@"head_bg"]width:1 height:260] y:0];
    [[[sagit addImageView:@"head" img:@"Leslie"]width:150 height:150] relate:LeftBottom v:20 v2:32]; //头像
    [[STLastImageView clipsToBounds:YES]layerCornerRadiusToHalf];
    
    [[[sagit addLabel:@"nickName" text:@"我是一只鸡" font:36 color:@"#FFFFFF" ]width:500] onRight:@"head" x:20 y:20 ];
    [[[sagit addLabel:@"description" text:@"loading...." font:26 color:@"FFFFFF"] onBottom:@"nickName" y:18]relate:LeftRight v:190 v2:22];
    [STLabel(@"description") numberOfLines:2];
    
    [[sagit addButton:@"editBtn" img:@"my_edit"] relate:TopRight v:22 + STStatusHeightPx v2:17];
}

@end
