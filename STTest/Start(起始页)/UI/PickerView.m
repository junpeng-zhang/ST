//
//  PickerView.m
//  STTest
//
//  Created by 张俊鹏 on 2017/12/6.
//  Copyright © 2017年 Leslie Cheung. All rights reserved.
//

#import "PickerView.h"
#import <Masonry.h>

@interface PickerView ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation PickerView

-(instancetype)init{
    if (self = [super init]) {
        [self _configview];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self _configview];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title array:(NSArray *)arr{
    _title = title;
    _dataArr = arr;
    self = [self initWithFrame:frame];
    return self;
}

-(void)setDefaultValue:(NSString *)value{
    
}

-(void)setTitle:(NSString *)title{
    _title = title;
}

-(void)_configview{
    self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    tap.delegate                = self;
    [self addGestureRecognizer:tap];
    
    UIView *backView = [UIView new];
    backView.clipsToBounds = YES;
    backView.layer.cornerRadius = 10.0f;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(230, 215));
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"popup_delete"] forState:UIControlStateNormal];
    [self addSubview:cancelBtn];
    
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).with.offset(23);
        make.centerX.equalTo(backView);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popup_top"]];
    [backView addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(backView);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *titleLabel = [UILabel new];
    [backView addSubview:titleLabel];
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    titleLabel.textColor = ColorWhite;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).with.offset(17);
        make.centerX.equalTo(self);
    }];
    
}

#pragma mark --- click event
- (void)tapClick {
    [self removeFromSuperview];
}

@end
