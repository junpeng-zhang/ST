//
//  BasicInfoView.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "BasicInfoView.h"

@implementation BasicInfoView

-(void)initUI{
    [self backgroundColor:MainHexColor];
    
    //headImageView
    [[[[[self addImageView:@"headImage" img:@"Leslie2"]relate:Top v:77]width:180 height:180]toCenter:X] addClick:@"headImage"];
    [STLastImageView corner:YES];
    
    //Line
    [[[[self addLine:@"nameLine"    color:LineColor]onBottom:@"headImage"   y:195]width:450 height:2]toCenter:X];
    [[[[self addLine:@"programLine" color:LineColor]onBottom:@"nameLine"    y:96]width:450 height:2] toCenter:X];
    [[[[self addLine:@"genderLine"  color:LineColor]onBottom:@"programLine" y:96]width:450 height:2] toCenter:X];
    
    //icon
    [[[self addImageView:@"icon_name"    img:@"re_name"]onTop:@"nameLine"       y:30]width:48 height:48];
    [[[self addImageView:@"icon_program" img:@"re_program"]onTop:@"programLine" y:30]width:48 height:48];
    [[[self addImageView:@"icon_gender"  img:@"re_gender"]onTop:@"genderLine"   y:30]width:48 height:48];
    
    //TF
    [[[self addTextField:@"nameTF" placeholder:@"Name"]onRight:@"icon_name" x:30]width:372 height:68];
    [[[self addTextField:@"programTF" placeholder:@"program"]onRight:@"icon_program" x:30]width:324 height:68];
    [[[self addTextField:@"genderTF" placeholder:@"Gender"]onRight:@"icon_gender" x:30]width:324 height:68];
    
    
    //BTN
    [[[self addButton:@"programBtn" img:@"down_arrow"]width:48 height:48]onRight:@"programTF" x:0];
    [[[self addButton:@"genderBtn" img:@"down_arrow"]width:48 height:48]onRight:@"genderTF" x:0];
    [[[[[self addButton:@"complete" title:@"Complete" font:40]width:450 height:80]onBottom:@"genderTF" y:83]toCenter:X] addClick:@"complete"];
    [[[STLastButton backgroundImage:@"registered_button_default"]titleColor:MainHexColor]adjustsImageWhenHighlighted:NO];
    
}

@end
