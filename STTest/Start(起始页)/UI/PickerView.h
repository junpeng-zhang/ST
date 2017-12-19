//
//  PickerView.h
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerView : UIView

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSArray *dataArr;

-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title array:(NSArray *)arr;

-(void)setDefaultValue:(NSString*) value;

@end
