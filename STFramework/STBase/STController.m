//
//  STViewController.m
//  IT恋
//
//  Created by suitian on 2017/5/11.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "STController.h"
#import "STView.h"
#import "STCategory.h"
#import <objc/runtime.h>
//#import "AppDelegate.h"

@interface STController()
@property (nonatomic,retain) NSMutableDictionary *data;//用于存数据的
@end

@implementation STController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data=[NSMutableDictionary new];
    //获取当前的类名
    NSString* className= NSStringFromClass([self class]);
    NSString* viewClassName=[className replace:@"Controller" with:@"View"];
    Class viewClass=NSClassFromString(viewClassName);
    if(viewClass!=nil)//view
    {
        self.view=self.UI=[[viewClass alloc] initWithController:self];
        //self.view.Name=viewClassName;
        [self.UI initView];
  
    }
    _box=[STMessageBox new];
    _http=[[STHttp alloc]init:_box];//不用单例，延时加载
    
}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent]; //状态栏设置为透明
//}
-(BOOL)isMatch:(NSString*)tipMsg isMatch:(BOOL)result
{
    if(!result)
    {
        [_box prompt:tipMsg];
    }
    return result;
}
-(BOOL)isMatch:(NSString*)tipMsg v:(NSString*)value regex:(NSString*)pattern
{
    if(value==nil || [value isEqualToString:@""])
    {
        [_box prompt:[tipMsg append:@"不能为空!"]];
        return NO;
    }
    else if(pattern!=nil && ![pattern isEqualToString:@""])
    {
        NSPredicate *match = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
        if(match)
        {
            if(![match evaluateWithObject:value])
            {
                [_box prompt:[tipMsg append:@"格式错误!"]];
                return NO;
            }
        }
        match=nil;
    }
    return YES;
}
-(NSString *)data:(NSString *)key{
    return _data[key];
}
-(void)setData:(NSString *)key v:(NSString *)value{
    [_data setObject:value forKey:key];
}
-(void)setValue:(NSString *)value
{
    [self.UI setValue:value];
}
//get set ui view....
-(NSString*)value:(NSString*)name
{
    id ui=self.UIList[name];
    if(ui!=nil)
    {
        return [((UIView*)ui) value];
    }
    return nil;
}
-(void)loadData:(NSDictionary*)data{[self.UI loadData:data];}
-(NSMutableDictionary*)formData{return [self.UI formData:nil];}
-(NSMutableDictionary*)formData:(id)superView{return [self.UI formData:superView];}



-(void)open:(UIView*)ui{
    NSString* name=[ui Name];
    if(name!=nil)
    {
        if(![name hasSuffix:@"Controller"])
        {
            name=[name append:@"Controller"];
        }
        Class class=NSClassFromString(name);
        if(class!=nil)
        {
            STController *controller=[class new];
            if(self.navigationController!=nil)
            {
                [self.navigationController pushViewController:controller animated:YES];
            }
            else
            {
                [self presentViewController:controller animated:YES completion:nil];
            }
        }
    }
    

}

-(void)asRoot:(RootViewControllerType)rootViewControllerType{
    
    UIViewController *controller=self;
    if(rootViewControllerType==RootViewNavigationType)
    {
        controller = [[UINavigationController alloc]initWithRootViewController:self];
    }
    [STController setRoot:controller];
}
+(void)setRoot:(UIViewController *)rootController{

    [UIApplication sharedApplication].keyWindow.rootViewController = rootController;
//    AppDelegate *delegate= (AppDelegate*)[UIApplication sharedApplication].delegate;
//    delegate.window.rootViewController=rootController;
    
}
-(void)dealloc
{
    _http=nil;
    _box=nil;
}
@end
