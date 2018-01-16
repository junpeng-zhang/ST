//
//  SettingController.m
//  STTest
//
//  Created by 张俊鹏 on 2018/1/16.
//  Copyright © 2018年 Leslie Cheung. All rights reserved.
//

#import "SettingController.h"

@interface SettingController ()

@end

@implementation SettingController

-(void)initUI{
    self.title = @"Setting";
    
    [[[sagit backgroundColor:ColorWhite] addTableView:nil style:UITableViewStyleGrouped] block:nil on:^(UITableView *table) {
        [[table sectionCount:4] rowCountInSections:@"1,3,2,1"];
//        [table rowCountInSections:@"1,3,2,1"];
        STWeakSelf;
        table.addCell = ^(UITableViewCell *cell, NSIndexPath *indexPath) {
            switch (indexPath.section) {
                case 0:
                    [cell.textLabel text:@"我是一只鸡"];
                    
                    break;
                case 1:
                    [cell.textLabel text:@"222"];
                    if(indexPath.row == 0){
                        [cell.textLabel text:@"一只羊"];
                        
                    }else if (indexPath.row == 1){
                        [cell.textLabel text:@"两只羊"];
                        
                    }else if (indexPath.row == 2){
                        [cell.textLabel text:@"三只羊"];
                    }
                    break;
                case 2:
                    if (indexPath.row == 0) {
                        [cell.textLabel text:@"咩"];
                    }else{
                        [cell.textLabel text:@"咩咩"];
                    }
                    break;
                default:
                    [cell.textLabel text:@"咩咩咩咩"];
                    break;
            }
        };
        
    }];
}

@end
