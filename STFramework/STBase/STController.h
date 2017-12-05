//
//  STController.h
//  IT恋
//
//  Created by suitian on 2017/5/11.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STHttp.h"
#import "STMessageBox.h"
#import "STEnum.h"

@class STView;
@interface STController : UIViewController
@property (nonatomic,strong) STView* UI;
@property (nonatomic,retain) STHttp *http;
@property (nonatomic,retain) STMessageBox *box;
//所有name的控件
@property (nonatomic,retain) NSMutableDictionary *UIList;

-(NSString*)value:(NSString*)name;
-(void)setValue:(NSString*)value;
-(BOOL)isMatch:(NSString*)tipMsg isMatch:(BOOL)result;
-(BOOL)isMatch:(NSString*)tipMsg v:(NSString*)value regex:(NSString*)pattern;

-(id)data:(NSString*)key;
-(void)setData:(NSString*)key v:(NSString*)value;
-(void)loadData:(NSDictionary*)data;
-(NSMutableDictionary*)formData;
-(NSMutableDictionary*)formData:(id)superView;


-(void)open:(UIView*)ui;

-(void)asRoot:(RootViewControllerType) rootType;
+(void)setRoot:(UIViewController*)rootController;
@end
