#//
//  STView.h
//  IT恋
//
//  Created by 陈裕强 on 2017/5/17.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STController.h"

@interface STView : UIView
//所对应的Controller
@property (nonatomic,retain) STController *Controller;
//所有name的控件
@property (nonatomic,retain)NSMutableDictionary *UIList;
//存档文本框的列表
@property (nonatomic,retain) NSMutableArray *UITextList;

//相对上一个控件的位置
//@property (nonatomic,assign)CGRect RelativeRect;

-(void)initView;
//初始化[子类重写]
-(void)initUI;
-(instancetype)initWithController:(STController*)controller;
-(void)loadData:(NSDictionary*)data;
-(NSMutableDictionary*)formData;
-(NSMutableDictionary*)formData:(id)superView;
@end
