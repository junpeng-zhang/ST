//
//  STViewCategory.m
//  IT恋
//
//  Created by 陈裕强 on 2017/5/21.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//
#import "STDefineUI.h"
#import "STUIView.h"
#import "STLayoutTracer.h"
#import "STCategory.h"
#import <objc/runtime.h>

@interface UIView()
//控件名称
@property (nonatomic,copy) NSString* Name;
//是否表单UI
@property (nonatomic,assign) BOOL IsFormUI;
//初始时的座标
@property (nonatomic,assign) CGRect OriginFrame;
//前一个UI视图
@property (nonatomic,retain) UIView* PreView;
//后一个UI视图
@property (nonatomic,retain) UIView* NextView;
//布局轨迹追踪者
@property (nonatomic,retain) NSMutableDictionary* LayoutTracer;
@end

@implementation UIView(ST)
static char namaChar='n';
static char isformUIChar='f';
static char preViewChar='p';
static char nextViewChar='e';
static char originFrameChar='o';
static char layoutTracerChar='l';
static NSInteger xyNone=-99999;

// Name
- (NSString*)Name{
    return objc_getAssociatedObject(self, &namaChar);
}
- (UIView*)setName:(NSString *)name{
    objc_setAssociatedObject(self, &namaChar, name,OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}
// Name
- (BOOL)IsFormUI{
    return [objc_getAssociatedObject(self, &isformUIChar) boolValue];
}
- (UIView*)setIsFormUI:(BOOL)yesNo{
    objc_setAssociatedObject(self, &isformUIChar, [@(yesNo) stringValue],OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}
// Name
- (UIView*)PreView{
    return (UIView*)objc_getAssociatedObject(self, &preViewChar);
}
- (UIView*)setPreView:(UIView*)view{
    objc_setAssociatedObject(self, &preViewChar, view,OBJC_ASSOCIATION_RETAIN);
    return self;
}
- (UIView*)NextView{
    return (UIView*)objc_getAssociatedObject(self, &nextViewChar);
}
- (UIView*)setNextView:(UIView*)view{
    objc_setAssociatedObject(self, &nextViewChar, view,OBJC_ASSOCIATION_RETAIN);
    return self;
}

- (CGRect)OriginFrame{
    return CGRectFromString(objc_getAssociatedObject(self, &originFrameChar));
}
- (UIView*)setOriginFrame:(CGRect)frame{
    objc_setAssociatedObject(self, &originFrameChar,NSStringFromCGRect(frame),OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}
// Name
- (NSMutableDictionary*)LayoutTracer{
    return (NSMutableDictionary*)objc_getAssociatedObject(self, &layoutTracerChar);
}
- (UIView*)setLayoutTracer:(NSMutableDictionary*)tracer{
    objc_setAssociatedObject(self, &layoutTracerChar, tracer,OBJC_ASSOCIATION_RETAIN);
    return self;
}

-(BOOL)isSTView
{
    return[self isKindOfClass:[STView class]];
}
-(BOOL)isOnSTView
{
    return self.superview!=nil && [self.superview isSTView];
}
-(STView*)STView
{
    if([self isSTView])
    {
        return (STView*)self;
    }
    else
    {
        UIView *view=[self superview];
        if(view!=nil)
        {
            return [view STView];
        }
        return nil;
    }
}
-(STController*)STController
{
    STView *stView=[self STView];
    if(stView!=nil){return stView.Controller;}
    return nil;
}
-(UIView*)setValue:(NSString*)value
{
    if([self isMemberOfClass:[UITextField class]])
    {
        ((UITextField*)self).text=value;
    }
    else if([self isMemberOfClass:[UITextView class]])
    {
        ((UITextView*)self).text=value;
    }
    else if([self isMemberOfClass:[UILabel class]])
    {
        ((UILabel*)self).text=value;
    }
    else if([self isMemberOfClass:[UIButton class]])
    {
        ((UIButton*)self).titleLabel.text=value;
    }
//    else if([self isMemberOfClass:[UISegmentedControl class]])
//    {
//        ((UISegmentedControl*)self).selectedSegmentIndex=[value intValue];
//    }
    else if([self isMemberOfClass:[UISlider class]])
    {
        ((UISlider*)self).value=[value floatValue];
    }
    else if([self isMemberOfClass:[UISwitch class]])
    {
         [((UISwitch*)self) setOn:[value boolValue]];
    }
    else if([self isMemberOfClass:[UIProgressView class]])
    {
        ((UIProgressView*)self).progress=[value floatValue];
    }
    else if([self isMemberOfClass:[UIStepper class]])
    {
        ((UIStepper*)self).value=[value doubleValue];
    }
    return self;
}
-(NSString*)value
{
    if([self isMemberOfClass:[UITextField class]])
    {
        return ((UITextField*)self).text;
    }
    else if([self isMemberOfClass:[UITextView class]])
    {
        return ((UITextView*)self).text;
    }
    else if([self isMemberOfClass:[UILabel class]])
    {
        return ((UILabel*)self).text;
    }
    else if([self isMemberOfClass:[UIButton class]])
    {
        return ((UIButton*)self).currentTitle;
    }
    else if([self isMemberOfClass:[UISegmentedControl class]])
    {
        return [@(((UISegmentedControl*)self).selectedSegmentIndex)stringValue];
    }
    else if([self isMemberOfClass:[UISlider class]])
    {
        return [@(((UISlider*)self).value)stringValue];
    }
    else if([self isMemberOfClass:[UISwitch class]])
    {
        return ((UISwitch*)self).isOn?@"1":@"0";
    }
    else if([self isMemberOfClass:[UIProgressView class]])
    {
        return [@(((UIProgressView*)self).progress) stringValue];
    }
    else if([self isMemberOfClass:[UIStepper class]])
    {
        return [@(((UIStepper*)self).value) stringValue];
    }
    return  nil;
}

#pragma mark addUIView
-(UIView *)lastSubView
{
    if(self.subviews.count>0)
    {
        return self.subviews[self.subviews.count-1];
    }
    return self;
}
-(UIView *)firstSubView
{
    if(self.subviews.count>0)
    {
        return self.subviews[0];
    }
    return self;
}

-(void)addView:(UIView *)view name:(NSString*)name{
    if(name!=nil)
    {
        view.Name=name;
        STView *stView=[self STView];
        if(stView!=nil)
        {
            [stView.UIList setObject:view forKey:name];
        }
    }
    if(self.subviews.count>0)//非第一个控件
    {
        UIView* lastView=[self lastSubView];
        lastView.NextView=view;
        view.PreView=lastView;
    }
    //NSLog(@"frame:%@",NSStringFromCGRect( view.OriginFrame ));

    [self addSubview:view];
}
-(UIButton *)addSwitch:(NSString *)name
{
    UISwitch *ui=[[UISwitch alloc] initWithFrame:STEmptyRect];
    [self addView:ui name:name];
    [ui setIsFormUI:YES];
    return ui;
}
-(UIButton *)addStepper:(NSString *)name
{
    UIStepper *ui=[[UIStepper alloc] initWithFrame:STEmptyRect];
    [self addView:ui name:name];
    [ui setIsFormUI:YES];

    return ui;
}
-(UIButton *)addSlider:(NSString *)name
{
    UISlider *ui=[[UISlider alloc] initWithFrame:STEmptyRect];
    [self addView:ui name:name];
    [ui setIsFormUI:YES];
    return ui;
}
-(UIButton *)addProgress:(NSString *)name
{
    UIProgressView *ui=[[UIProgressView alloc] initWithFrame:STEmptyRect];
    [self addView:ui name:name];
    [ui setIsFormUI:YES];
    return ui;
}

-(UILabel*)addLabel:(NSString*)text name:(NSString*)name
{
    UILabel *ui = [[UILabel alloc] initWithFrame:STEmptyRect];
    ui.text = text;
    [self addView:ui name:name];
    return ui;
}
-(UILabel*)addLabel:(NSString*)text
{
    return [self addLabel:text name:nil];
}
-(UIImageView*)addImageView:(NSString*)imgName
{
    UIImageView *ui = [[UIImageView alloc] initWithFrame:STEmptyRect];
    if(imgName!=nil)
    {
        [ui setImage:[UIImage imageNamed:imgName]];
    }
    [self addView:ui name:nil];
    return ui;
}
-(UIImageView*)addImageView:(NSString*)imgName xyFlag:(XYFlag)xyFlag
{
    CGRect frame=self.frame;
    if([self isKindOfClass:[UIScrollView class]])//计算ImageView的位置和UIScrollView的contentSize
    {
        UIScrollView *scroll= (UIScrollView*)self;
        long count= self.subviews.count;//这么计算的话，ImageView必须先添加，然后才能添加其它控件。
        CGSize size=scroll.contentSize;
        if(xyFlag==X)
        {
            frame.origin.x=frame.size.width*(count);
            scroll.showsHorizontalScrollIndicator=NO;
            size.width=size.width+frame.size.width;
        }
        else
        {
            scroll.showsVerticalScrollIndicator=NO;
            frame.origin.y=frame.size.height*(count);
            size.height=size.height+frame.size.height;
            
        }
        scroll.contentSize=size;
    }
    UIImageView *ui = [[UIImageView alloc] initWithFrame:frame];
    [ui setImage:[UIImage imageNamed:imgName]];
    [self addView:ui name:nil];
    return ui;
}
-(UITextField*)addTextField:(NSString*)name
{
    return [self addTextField:name placeholder:nil];
}
-(UITextField*)addTextField:(NSString*)name placeholder:(NSString*)placeholder
{
    UITextField *ui = [[UITextField alloc] initWithFrame:STEmptyRect];
//    ui.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
//    ui.layer.borderWidth = 1.0; // set borderWidth as you want.
    if(placeholder!=nil)
    {
        ui.placeholder=placeholder;
    }
    STView *view=[self STView];//追加到UITextFieldList中
    if(view!=nil)
    {
        [view.UITextList addObject:ui];
    }
    [ui setIsFormUI:YES];
    [self addView:ui name:name];
    return ui;
}
-(UITextView *)addTextView:(NSString *)name
{
    UITextView* ui=[[UITextView alloc] initWithFrame:STEmptyRect];
    STView *view=[self STView];//追加到UITextFieldList中
//    ui.scrollEnabled = NO;
//    ui.scrollsToTop = NO;
    ui.layer.cornerRadius = 4;
    ui.layer.borderWidth = 1;
    //当textview的字符串为0时发送（rerurn）键无效
    ui.enablesReturnKeyAutomatically = YES;
    ui.keyboardType = UIKeyboardTypeDefault;
    //键盘return样式变成发送
    ui.returnKeyType = UIReturnKeySend;

    ui.font = [UIFont systemFontOfSize:14];
//    ui.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.4] CGColor];
    //加下面一句话的目的是，是为了调整光标的位置，让光标出现在UITextView的正中间
    //ui.textContainerInset = UIEdgeInsetsMake(10,0, 0, 0);
    if(view!=nil)
    {
        [view.UITextList addObject:ui];
    }
    [ui setIsFormUI:YES];
    [ui sizeToFit];
    [self addView:ui name:name];
    return ui;

}
-(UIButton*)addButton:(NSString*)name
{
    return [self addButton:name imgName:nil click:nil];
}
-(UIButton*)addButton:(NSString*)name imgName:(NSString*)imgName
{
    return [self addButton:name imgName:imgName click:nil];
}
-(UIButton*)addButton:(NSString*)name imgName:(NSString*)imgName click:(NSString*)event
{
    return [self addButton:name title:nil imgName:imgName click:event];
}
-(UIButton*)addButton:(NSString*)name title:(NSString*)title
{
    return [self addButton:name title:title click:nil];
}
-(UIButton*)addButton:(NSString*)name title:(NSString*)title click:(NSString*)event
{
    return [self addButton:name title:title imgName:nil click:event];
}
-(UIButton*)addButton:(NSString*)name title:(NSString*)title imgName:(NSString*)imgName click:(NSString*)event
{
    UIButton *ui=[UIButton buttonWithType:0];
    if(title!=nil)
    { 
        [ui setTitle:title forState:UIControlStateNormal];
        ui.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    if(imgName!=nil)
    {
        [ui setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    if(event!=nil || name!=nil)
    {
        if([self isKindOfClass:[UIImageView class]])
        {
            self.userInteractionEnabled=YES;
        }
        STController *controller=[self STController];
        if(controller!=nil)
        {
            SEL sel=nil;
            BOOL isEvent=NO;
            if(event!=nil)
            {
                sel=NSSelectorFromString(event);
                isEvent=[controller respondsToSelector:sel];
            }
            else
            {
                //name chat
                sel=NSSelectorFromString([name append:@"Click:"]);
                isEvent=[controller respondsToSelector:sel];
                if(!isEvent)
                {
                    sel=NSSelectorFromString([name append:@"Click:"]);
                    isEvent=[controller respondsToSelector:sel];
                }
                if(!isEvent)
                {
                    Class class= NSClassFromString([name append:@"Controller"]);
                    if(class!=nil)
                    {
                        sel=NSSelectorFromString(@"open:");
                        isEvent=YES;
                    }

                }
            }
            if(isEvent)
            {
                [ui addTarget:controller action:sel forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    [self addView:ui name:name];
    return ui;
}
-(UIView*)addLine:(UIColor*)color
{
    UIView *ui = [[UIView alloc] initWithFrame:STEmptyRect];
    ui.backgroundColor = color;
    [self addView:ui name:nil];
    return ui;
}
-(UIView*)addRectangle
{
    UIView *ui = [[UIView alloc] initWithFrame:STEmptyRect];
    [self addView:ui name:nil];
    return ui;
}
-(UIScrollView *)addScrollView
{
    UIScrollView *ui=[[UIScrollView alloc] initWithFrame:STFullRect];
    //设置边缘不弹跳
    ui.bounces = NO;
    //整页滚动
    ui.pagingEnabled = YES;
//    ui.backgroundColor=[UIColor redColor];
    //ui.showsHorizontalScrollIndicator=NO;
    ui.delegate=(id)[self STController];
    [self addView:ui name:nil];
    return ui;
}
-(UIScrollView *)addScrollView:(NSString*)imgName,...NS_REQUIRES_NIL_TERMINATION
{
    UIScrollView *ui=[self addScrollView];
    if(imgName)
    {
        va_list args;
        va_start(args, imgName);
        [ui addImageView:imgName xyFlag:X];//内部会重设contentSize属性
        NSString *otherImgName;
        
        while ((otherImgName = va_arg(args, NSString *))) {
            [ui addImageView:otherImgName xyFlag:X];
        }
        va_end(args);
    }
    
    return ui;
}
-(UIView*)stretch
{
    return [self stretch:0 y:0];
}
-(UIView*)stretch:(CGFloat)x
{
    return [self stretch:x y:0];
}
-(UIView*)stretch:(CGFloat)x y:(CGFloat)y
{
    if([self isKindOfClass:[UIImageView class]])
    {
        UIImageView *me=(UIImageView*)self;
        if(me.image!=nil)
        {
            CGFloat left,right,top,bottom;
            if(x==0){left=right=(me.image.size.width/STScreenScale*Xpx2-2)/2;}
            else
            {
                left=x;
                right=me.image.size.width/STScreenScale*Xpx2-left-2;
            }
            if(y==0)
            {
                top=bottom=(me.image.size.height/STScreenScale*Ypx2-2)/2;
            }
            else
            {
                top=y;
                bottom=me.image.size.height/STScreenScale*Ypx2-top-2;
            }
           

            // 设置端盖的值
            UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
            // 拉伸图片
            me.image = [me.image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch];
        }
    }
    return self;

}
#pragma mark [相对布局方法] RelativeLayout
//如果当前没设置frame，则用指定的frame
-(CGRect)checkFrameIsEmptyOrFull:(CGRect)uiFrame
{
    if(CGRectEqualToRect(self.frame, STEmptyRect) || CGRectEqualToRect(self.frame, STFullRect))
    {
        return uiFrame;
    }
    return self.frame;
}
-(CGSize)superSize
{
    if(self.superview==nil)
    {
        return STFullSize;
    }
    return self.superview.frame.size;
}
-(CGRect)getUIFrame:(UIView*)ui
{
    if(ui==nil)
    {
        if(self.superview==nil)
        {
            return STFullRect;
        }
        
        return self.superview.frame;
    }
    return ui.frame;
}
//在右边
-(UIView*)onRight:(UIView*)ui x:(CGFloat)x
{
    return [self onRight:ui x:x y:0];
}
-(UIView*)onRight:(UIView*)ui x:(CGFloat)x y:(CGFloat)y
{
    [self addTracer:ui method:@"onRight" v1:x v2:y v3:0 v4:0 location:0 xyFlag:0];
    CGRect uiFrame=[self getUIFrame:ui];
    CGRect frame=[self checkFrameIsEmptyOrFull:uiFrame];
    
    //检测是否有onLeft规则，若有，调整宽度
    if([self.LayoutTracer has:@"onLeft"])
    {
        frame.size.width=(frame.origin.x+frame.size.width)-uiFrame.origin.x-uiFrame.size.width-x*Xpt;
    }
    frame.origin.x=uiFrame.size.width+uiFrame.origin.x+x*Xpt;
    frame.origin.y=uiFrame.origin.y+y*Ypt;
    
    //检测是否有onLeft规则，若有，调整宽度
    
    [self frame:frame];
    return self;
}
//在左边
-(UIView*)onLeft:(UIView*)ui x:(CGFloat)x
{
    return [self onLeft:ui x:x y:0];
    
}
-(UIView*)onLeft:(UIView*)ui x:(CGFloat)x y:(CGFloat)y
{
    [self addTracer:ui method:@"onLeft" v1:x v2:y v3:0 v4:0 location:0 xyFlag:0];
    
    CGRect uiFrame=[self getUIFrame:ui];
    CGRect frame=[self checkFrameIsEmptyOrFull:uiFrame];
    
    //检测是否有onRight规则，若有，调整宽度
    if([self.LayoutTracer has:@"onRight"])
    {
        frame.size.width=uiFrame.origin.x-x*Xpt-frame.origin.x;;
    }
    else
    {
        frame.origin.x=uiFrame.origin.x-frame.size.width-x*Xpt;
    }
    frame.origin.y=uiFrame.origin.y+y*Ypt;
    
    [self frame:frame];
    return self;
}
//在上边
-(UIView*)onTop:(UIView*)ui y:(CGFloat)y
{
    return [self onTop:ui y:y x:0];
}
-(UIView*)onTop:(UIView*)ui y:(CGFloat)y x:(CGFloat)x
{
    [self addTracer:ui method:@"onTop" v1:y v2:x v3:0 v4:0 location:0 xyFlag:0];
    CGRect uiFrame=[self getUIFrame:ui];
    CGRect frame=[self checkFrameIsEmptyOrFull:uiFrame];
    
    //检测是否有onBottom规则，若有，调整高度
    if([self.LayoutTracer has:@"onBottom"])
    {
        frame.size.height=uiFrame.origin.y-y*Ypt-frame.origin.y;
    }
    else
    {
        frame.origin.y=uiFrame.origin.y-frame.size.height-y*Ypt;
    }
    
    frame.origin.x=uiFrame.origin.x+x*Xpt;
    [self frame:frame];
    return self;
}
//在下边
-(UIView *)onBottom:(UIView*)ui y:(CGFloat)y
{
    return [self onBottom:ui y:y x:0];
}
-(UIView *)onBottom:(UIView*)ui y:(CGFloat)y x:(CGFloat)x
{
    [self addTracer:ui method:@"onBottom" v1:y v2:x v3:0 v4:0 location:0 xyFlag:0];
    CGRect uiFrame=[self getUIFrame:ui];
    CGRect frame=[self checkFrameIsEmptyOrFull:uiFrame];
    //检测是否有onTop规则，若有，调整高度
    if([self.LayoutTracer has:@"onTop"])
    {
        frame.size.height=(frame.origin.y+frame.size.height)-uiFrame.origin.y-uiFrame.size.height-y*Ypt;
    }
    frame.origin.y=uiFrame.origin.y+ui.frame.size.height+y*Ypt;
    frame.origin.x=uiFrame.origin.x+x*Xpt;
    [self frame:frame];
    return self;
}
-(UIView*)relate:(XYLocation)location v:(CGFloat)value
{
    return [self relate:location v:value v2:xyNone v3:xyNone v4:xyNone];
}
-(UIView*)relate:(XYLocation)location v:(CGFloat)value v2:(CGFloat)value2
{
    return [self relate:location v:value v2:value2 v3:xyNone v4:xyNone];
}
-(UIView*)relate:(XYLocation)location v:(CGFloat)value v2:(CGFloat)value2 v3:(CGFloat)value3
{
    return [self relate:location v:value v2:value2 v3:value3 v4:xyNone];
}
-(UIView*)relate:(XYLocation)location v:(CGFloat)value v2:(CGFloat)value2 v3:(CGFloat)value3 v4:(CGFloat)value4
{
    [self addTracer:nil method:@"relate" v1:value v2:value2 v3:value3 v4:value4 location:location xyFlag:0];
    CGFloat left=xyNone,top=xyNone,right=xyNone,bottom=xyNone;
    switch (location) {
        case Left:
            left=value;
            break;
        case Right:
            right=value;
            break;
        case Top:
            top=value;
            break;
        case Bottom:
            bottom=value;
            break;
        //tow values
        case LeftTop:
            left=value;
            top=value2==xyNone?value:value2;
            break;
        case LeftRight:
            left=value;
            right=value2==xyNone?value:value2;
            break;
        case LeftBottom:
            left=value;
            bottom=value2==xyNone?value:value2;
            break;
        case TopRight:
            right=value;
            top=value2==xyNone?value:value2;
            break;
        case RightBottom:
            right=value;
            bottom=value2==xyNone?value:value2;
            break;
        case TopBottom:
            top=value;
            bottom=value2==xyNone?value:value2;
            break;
        //three values
        case LeftTopRight:
            left=value;
            top=value2==xyNone?value:value2;
            right=value3==xyNone?left:value3;
            break;
        case LeftTopBottom:
            left=value;
            top=value2==xyNone?value:value2;
            bottom=value3==xyNone?top:value3;
            break;
        case LeftBottomRight:
            left=value;
            bottom=value2==xyNone?value:value2;
            right=value3==xyNone?left:value3;
            break;
        case TopRightBottom:
            top=value;
            right=value2==xyNone?value:value2;
            bottom=value3==xyNone?top:value3;
            break;
            //four values
        default:
        case LeftTopRightBottom:
            left=value;
            top=value2==xyNone?value:value2;
            right=value3==xyNone?left:value3;
            bottom=value4==xyNone?top:value4;
            break;
    }
    return [self relate:LeftTopRightBottom left:left top:top right:right bottom:bottom];
}
-(UIView*)relate:(XYLocation)location left:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom
{
    if(left>=0 && left<=1){left=[self superSize].width*Xpx*left;}
    if(top>=0 && top<=1){top=[self superSize].height*Ypx*top;}
    
    if(right>=0 && right<=1){right=[self superSize].width*Xpx*right;}
    if(bottom>=0 && bottom<=1){bottom=[self superSize].height*Ypx*bottom;}
    

    CGSize superSize=[self superSize];
    CGRect frame=self.frame;
    frame.origin=CGPointZero;//归零处理
    if(left!=xyNone && right!=xyNone)
    {
        frame.size.width=superSize.width-left*Xpt-right*Xpt;
    }
    if(top!=xyNone && bottom!=xyNone)
    {
        frame.size.height=superSize.height-top*Ypt-bottom*Ypt;
    }
    if(left!=xyNone)
    {
        frame.origin.x=floor(left*Xpt);
    }
    else if(right!=xyNone)
    {
        frame.origin.x=floor(superSize.width-frame.size.width-right*Xpt);
    }
    if(top!=xyNone)
    {
        frame.origin.y=floor(top*Ypt);
    }
    else if(bottom!=xyNone)
    {
        frame.origin.y=floor(superSize.height-frame.size.height-bottom*Xpt);
    }
    [self frame:frame];
    return self;
}


-(UIView*)toCenter
{
    return [self toCenter:0];
}
-(UIView*)toCenter:(XYFlag)flag
{
    [self addTracer:nil method:@"toCenter" v1:0 v2:0 v3:0 v4:0 location:0 xyFlag:flag];
    CGRect frame=self.frame;
    CGSize superSize=[self superSize];
    if(flag==1 || flag==0)
    {
        frame.origin.x=superSize.width/2-frame.size.width/2;
    }
    if(flag==2 || flag==0)
    {
        frame.origin.y=superSize.height/2-frame.size.height/2;
    }
    [self frame:frame];
    return self;
}
-(UIView*)x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    [self width:width height:height];
    return [self relate:LeftTop v:x v2:y];
}
-(UIView*)frame:(CGRect)frame
{
    frame.origin.x=roundf(frame.origin.x);
    frame.origin.y=roundf(frame.origin.y);
    frame.size.width=roundf(frame.size.width);
    frame.size.height=roundf(frame.size.height);
    self.frame=frame;
//    CGPoint center=self.center;
//    center.x=floor(self.center.x);
//    center.y=floor(self.center.y);
//    self.center=center;
    return self;
}

//-(UIView*)backgroundColor:(id)backgroundColor
//{
//    if([backgroundColor isKindOfClass:[UIColor class]])
//    {
//        self.backgroundColor=backgroundColor;
//    }
//    else if([backgroundColor isKindOfClass:[NSString class]])
//    {
//                 
//    }
//    return self;
//}
-(UIView*)bgColor:(UIColor*)backgroundColor{
    self.backgroundColor=backgroundColor;
    return self;
}

-(CGFloat)x{return self.frame.origin.x*Xpx;}
-(CGFloat)y{return self.frame.origin.y*Ypx;}
-(CGFloat)width{return self.frame.size.width*Xpx;}
-(CGFloat)height{return self.frame.size.height*Ypx;}
-(CGFloat)absX{
    if(self.superview!=nil)
    {
        return self.x+[self.superview absX];
    }
    return self.x;
}
-(CGFloat)absY{
    if(self.superview!=nil)
    {
        return self.y+[self.superview absY];
    }
    return self.y;
}
-(UIView*)x:(CGFloat)x
{
    return [self x:x y:[self y]];
}
-(UIView*)x:(CGFloat)x y:(CGFloat)y
{
    return [self relate:LeftTop v:x v2:y];
}

-(UIView*)y:(CGFloat)y
{
    return [self x:[self x] y:y];
}
-(UIView*)width:(CGFloat)width
{
    return [self width:width height:[self height]];
}
-(UIView*)width:(CGFloat)width height:(CGFloat)height
{
    if((width>=0 && width<=1) ||(height>=0 && height<=1))
    {
        [self addTracer:nil method:@"widthHeight" v1:width v2:height v3:0 v4:0 location:0 xyFlag:0];
        if(width>=0 && width<=1){width=[self superSize].width*Xpx*width;}
        if(height>=0 && height<=1){height=[self superSize].height*Ypx*height;}
        
    }
    
    CGRect frame=self.frame;
    frame.size=STSizeMake(width, height);
    [self frame:frame];
    return self;

}
-(UIView*)width:(CGFloat)width height:(CGFloat)height x:(CGFloat)x y:(CGFloat)y
{
    [self width:width height:height];
    return [self x:x y:y];
}
-(UIView*)height:(CGFloat)height
{
    return [self width:[self width] height:height];
}
-(UIView*)moveTo:(CGRect)frame
{
    if(!CGPointEqualToPoint(frame.origin, self.frame.origin))
    {
        if(CGRectEqualToRect(self.OriginFrame, CGRectZero))
        {
            self.OriginFrame=self.frame;
        }
        [UIView beginAnimations:nil context:NULL];//此处添加动画，使之变化平滑一点
        [UIView setAnimationDuration:0.2];
        [self frame:frame];
        [UIView commitAnimations];
    }
    return self;
}
-(UIView*)backToOrigin
{
    if(!CGRectEqualToRect(self.OriginFrame, self.frame))
    {
        [self moveTo:self.OriginFrame];
    }
    return self;
}
-(void)addTracer:(UIView*)view method:(NSString*)method v1:(CGFloat)v1 v2:(CGFloat)v2 v3:(CGFloat)v3 v4:(CGFloat)v4
        location:(XYLocation)location xyFlag:(XYFlag)xyFlag
{
    if(self.LayoutTracer==nil)
    {
        self.LayoutTracer=[NSMutableDictionary new];
    }
    if(self.LayoutTracer[method]==nil)
    {
        STLayoutTracer *tracer=[STLayoutTracer new];
        tracer.view=view;
        tracer.v1=v1;
        tracer.v2=v2;
        tracer.v3=v3;
        tracer.v4=v4;
        tracer.location=location;
        tracer.xyFlag=xyFlag;
        
        [self.LayoutTracer setObject:tracer forKey:method];
    }
}
-(UIView*)refleshLayout
{
    return [self refleshLayout:YES];
}
-(UIView*)refleshLayout:(BOOL)withWidthHeight{
    NSMutableDictionary* tracer=self.LayoutTracer;
    if(tracer!=nil && tracer.count>0)
    {
        for (NSString*method in tracer)
        {
            STLayoutTracer *v=tracer[method];
            if ([method isEqualToString:@"toCenter"])
            {
                [self toCenter:v.xyFlag];
            }
            else if ([method isEqualToString:@"relate"])
            {
                [self relate:v.location v:v.v1 v2:v.v2 v3:v.v3 v4:v.v4];
            }
            else if ([method isEqualToString:@"onLeft"])
            {
                [self onLeft:v.view x:v.v1 y:v.v2];
            }
            else if ([method isEqualToString:@"onTop"])
            {
                [self onTop:v.view y:v.v1 x:v.v2];
            }
            else if ([method isEqualToString:@"onRight"])
            {
                [self onRight:v.view x:v.v1 y:v.v2];
            }
            else if ([method isEqualToString:@"onBottom"])
            {
                [self onBottom:v.view y:v.v1 x:v.v2];
            }
            else if (withWidthHeight && [method isEqualToString:@"widthHeight"])
            {
                CGRect frame=self.frame;//处理百分比
                if(v.v1>=0 && v.v1<=1){frame.size.width=[self superSize].width*v.v1;}
                if(v.v2>=0 && v.v2<=1){frame.size.height=[self superSize].height*v.v2;}
                [self frame:frame];
            }
        }
    }
    if(self.subviews!=nil && self.subviews.count>0)
    {
        for (int i=0; i<self.subviews.count; i++) {
            [self.subviews[i] refleshLayout:withWidthHeight];
            //NSLog(@"subviewframe:%@",NSStringFromCGRect(self.subviews[i].frame));
        }
    }
    return self;
}
@end
