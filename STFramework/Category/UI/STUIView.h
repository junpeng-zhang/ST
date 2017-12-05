//
//  STViewCategory.h
//  IT恋
//
//  Created by 陈裕强 on 2017/5/21.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "STController.h"
#import "STView.h"

@interface UIView(ST)

-(STController*)STController;
-(STView*)STView;
-(BOOL)isSTView;
-(BOOL)isOnSTView;
- (NSString*)Name;
- (UIView*)setName:(NSString *)name;
-(NSString*)value;
-(UIView*)setValue:(NSString*)value;
- (BOOL)IsFormUI;
- (UIView*)setIsFormUI:(BOOL)yesNo;
- (UIView*)PreView;
- (UIView*)setPreView:(UIView*)view;
- (UIView*)NextView;
- (UIView*)setNextView:(UIView*)view;
- (CGRect)OriginFrame;
- (UIView*)setOriginFrame:(CGRect)frame;
- (NSMutableDictionary*)LayoutTracer;
- (UIView*)setLayoutTracer:(NSMutableDictionary*)tracer;
-(CGSize)superSize;

-(void)addView:(UIView *)view name:(NSString*)name;
-(UIButton*)addSwitch:(NSString*)name;
-(UIButton *)addStepper:(NSString *)name;
-(UIButton *)addSlider:(NSString *)name;
-(UIButton *)addProgress:(NSString *)name;

-(UILabel*)addLabel:(NSString*)text;
-(UILabel*)addLabel:(NSString*)text name:(NSString*)name;

-(UIImageView*)addImageView:(NSString*)imgName;
-(UIImageView*)addImageView:(NSString*)imgName xyFlag:(XYFlag)xyFlag;

-(UITextField*)addTextField:(NSString*)name;
-(UITextField*)addTextField:(NSString*)name placeholder:(NSString*)placeholder;
-(UITextView*)addTextView:(NSString*)name;

-(UIButton*)addButton:(NSString*)name;
-(UIButton*)addButton:(NSString*)name imgName:(NSString*)imgName;
-(UIButton*)addButton:(NSString*)name imgName:(NSString*)imgName click:(NSString*)event;
-(UIButton*)addButton:(NSString*)name title:(NSString*)title;
-(UIButton*)addButton:(NSString*)name title:(NSString*)title click:(NSString*)event;
-(UIView*)addLine:(UIColor*)color;
-(UIView*)addRectangle;
-(UIScrollView*)addScrollView;
-(UIScrollView *)addScrollView:(NSString*)imgName,...NS_REQUIRES_NIL_TERMINATION;

-(UIView*)lastSubView;
-(UIView*)firstSubView;
-(UIView*)stretch;
-(UIView*)stretch:(CGFloat)x;
-(UIView*)stretch:(CGFloat)x y:(CGFloat)y;

#pragma mark [相对布局方法] RelativeLayout
-(UIView*)onRight:(UIView*)ui x:(CGFloat)x;
-(UIView*)onRight:(UIView*)ui x:(CGFloat)x y:(CGFloat)y;
-(UIView*)onLeft:(UIView*)ui x:(CGFloat)x;
-(UIView*)onLeft:(UIView*)ui x:(CGFloat)x y:(CGFloat)y;
-(UIView*)onTop:(UIView*)ui y:(CGFloat)y;
-(UIView*)onTop:(UIView*)ui y:(CGFloat)y x:(CGFloat)x;
-(UIView *)onBottom:(UIView*)ui y:(CGFloat)y;
-(UIView *)onBottom:(UIView*)ui y:(CGFloat)y x:(CGFloat)x;
-(UIView*)relate:(XYLocation)location v:(CGFloat)value;
-(UIView*)relate:(XYLocation)location v:(CGFloat)value v2:(CGFloat)value2;
-(UIView*)relate:(XYLocation)location v:(CGFloat)value v2:(CGFloat)value2 v3:(CGFloat)value3;
-(UIView*)relate:(XYLocation)location v:(CGFloat)value v2:(CGFloat)value2 v3:(CGFloat)value3 v4:(CGFloat)value4;
//-(UIView*)relate:(UIView*)ui x:(CGFloat)x y:(CGFloat)y;
//-(UIView*)relate:(UIView*)ui x:(CGFloat)x y:(CGFloat)y location:(XYLocation)xyLocation;
-(UIView*)toCenter;
-(UIView*)toCenter:(XYFlag)xyFlag;


//-(UIView*)frame:(CGFloat)x y:(CGFloat)y w:(CGFloat)width h:(CGFloat)height;
-(UIView*)frame:(CGRect) frame;

-(UIView*)bgColor:(UIColor*)backgroundColor;

-(CGFloat)x;
-(CGFloat)absX;
-(CGFloat)y;
-(CGFloat)absY;
-(CGFloat)width;
-(CGFloat)height;

-(UIView*)x:(CGFloat)x;
-(UIView*)x:(CGFloat)x y:(CGFloat)y;
-(UIView*)x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
-(UIView*)y:(CGFloat)y;
-(UIView*)width:(CGFloat)width;
-(UIView*)width:(CGFloat)width height:(CGFloat)height;
-(UIView*)width:(CGFloat)width height:(CGFloat)height x:(CGFloat)x y:(CGFloat)y;
-(UIView*)height:(CGFloat)height;
-(UIView*)moveTo:(CGRect)frame;
-(UIView*)backToOrigin;
-(UIView*)refleshLayout;
-(UIView*)refleshLayout:(BOOL)withWidthHeight;
@end


