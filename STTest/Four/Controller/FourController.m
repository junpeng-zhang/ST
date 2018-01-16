//
//  FourController.m
//  STTest
//
//  Created by 张俊鹏 on 2018/1/9.
//  Copyright © 2018年 Leslie Cheung. All rights reserved.
//

#import "FourController.h"

@interface FourController ()

@end

@implementation FourController

-(void)initUI{
    [sagit backgroundColor:ColorWhite];
    self.title = @"我是一只鸡";
    [[self needNavBar:NO setNavBar:YES].view backgroundColor:@"#f4f4f4"];
    
    [sagit addSTView:@"HeadView"];
    
    [[[[sagit addTableView:@"tableView" ]autoHeight:YES] onBottom:STPreView y:20] backgroundColor:ColorWhite];
    STLastTableView.addCell = ^(UITableViewCell *cell, NSIndexPath *indexPath) {
//      cell.imageView.image
        cell.imageView.image = STImage(cell.source[@"icon"]);
        cell.textLabel.text  = cell.source[@"text"];
        [cell addClick:cell.source[@"event"]];
    };
//    [[STLastTableView sectionCount:4] rowCountInSections:@"1,3,2,1"];
    
}

-(void)initData{
    STFirstTable.source   = @[
                            @{@"icon" : @"my_icon_set"    ,@"text"  : @"系统设置" ,@"event"  : @"Setting" },
                            @{@"icon" : @"my_icon_opinion",@"text"  : @"意见反馈" ,@"event"  : @"FeedBack"},
                            @{@"icon" : @"my_icon_about"  ,@"text"  : @"关于洋洋" ,@"event"  : @"about"   },
//                            @{@"icon" : @"",@"text" : @"我的二维码",@"event" : @"MyQRcode"}
                             ];
//    [STFirstTable reloadData];
}

@end
