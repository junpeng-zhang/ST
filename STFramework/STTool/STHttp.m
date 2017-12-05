//
//  STHttp.m
//  IT恋
//
//  Created by 陈裕强 on 2017/5/17.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import "STHttp.h"
#import "STMessageBox.h"
#import "STCategory.h"
#import <AFNetworking.h>

@interface STHttp()
@property (nonatomic,strong) AFHTTPSessionManager *http;
@property (nonatomic,strong) STMessageBox *box;
@end

@implementation STHttp

+ (instancetype)share {
    static STHttp *_share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _share = [[STHttp alloc] init:nil];
    });
    return _share;
}
+ (instancetype)shareWithLoading {
    static STHttp *_share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _share = [[STHttp alloc] init:[STMessageBox share]];
    });
    return _share;
}
-(instancetype)init:(STMessageBox*)box{
    _box=box;
    return self;
}
-(AFHTTPSessionManager*)http
{
    if(_http==nil)
    {
        _http=[AFHTTPSessionManager new];
        //增加这几行代码；
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [securityPolicy setAllowInvalidCertificates:YES];
        _http.securityPolicy = securityPolicy;
        
        _http.responseSerializer = [AFJSONResponseSerializer serializer];//以字典格式返回数据
    }
    return _http;
}
-(void)get:(NSString *)url paras:(NSDictionary *)paras success:(Success)success error:(Error)error{
    [self reSetHeader];
    [self showLoading];
    url=[self reSetUrl:url];
    [self.http GET:url parameters:paras progress:nil
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           [self onSucess:responseObject success:success];
       }
       failure:^(NSURLSessionDataTask *task, NSError *errorMsg) {
           [self onError:errorMsg error:error];
       }];
}
-(void)post:(NSString *)url paras:(NSDictionary *)paras success:(Success)success error:(Error)error{
    [self reSetHeader];
    if ([NSThread currentThread] == [NSThread mainThread]) {
        [self showLoading];
    }else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self showLoading];
        });
    }
    url=[self reSetUrl:url];
    [self.http POST:url parameters:paras progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self onSucess:responseObject success:success];
        }
        failure:^(NSURLSessionDataTask *task, NSError *errorMsg) {
            [self onError:errorMsg error:error];
        }];
}
-(void)upload:(NSString *)url data:(NSData *)data success:(Success)success error:(Error)error
{
    if(data!=nil)
    {
        NSDictionary *paras=[NSDictionary dictionaryWithObjectsAndKeys:data,@"photo", nil];
        [self upload:url paras:paras success:success error:error];
    }
    else
    {
        [self showError];
    }
}

-(void)upload:(NSString *)url paras:(NSDictionary *)paras success:(Success)success error:(Error)error{
    [self reSetHeader];
    [self showLoading];
    url=[self reSetUrl:url];
    NSMutableDictionary *dic=[NSMutableDictionary new];
    if(paras)
    {
        for (NSString*key in paras) {
            id v=paras[key];
            if(![v isKindOfClass:[NSData class]])
            {
                [dic setValue:paras[key] forKey:key];
            }
        }
        if(dic.count==0){dic=nil;}
    }
    [self.http POST:url
     parameters:dic
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
     {
         if(paras!=nil)
         {
             for (NSString*key in paras) {
                 id v=paras[key];
                 if([v isKindOfClass:[NSData class]])
                 {
                     [formData appendPartWithFileData:paras[key] name:key fileName:[key append:@".jpg"] mimeType:@"image/jpeg"];
                 }
             }
         }
     }
       progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         [self onSucess:responseObject success:success];
     }
     
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errorMsg) {
            [self onError:errorMsg error:error];
            
        }];
}

-(void)onSucess:(NSDictionary*) response success:(Success)success
{
    [self hideLoading];
    if(success!=nil)
    {
        STModel *model=[[STModel alloc]initWithDictionary:response error:nil];
        success(model);
    }
}
-(void)onError:(NSError*)errorMsg error:(Error)error
{
    [self hideLoading];
    if(error!=nil)
    {
        error([NSString toString:errorMsg]);
    }
    else{
        [self showError];
    }
}
-(NSString*)reSetUrl:(NSString*)url
{
//    if(![url hasPrefix:@"http://"] && ![url hasPrefix:@"https://"] && self.BaseUrl!=nil)
//    {
//        url=[self.BaseUrl append:url];
//    }
    return  url;
}
-(void)setHeader:(NSString *)key v:(NSString *)value{
    [self.http.requestSerializer setValue:value forHTTPHeaderField:key];
}
//可以扩展此方法，以便增加初始的请求头。
-(void)reSetHeader{

}


-(void)showLoading{
    if(self.box!=nil){[self.box loading];}
}
-(void)hideLoading{
    if(self.box!=nil){[self.box hideLoading];}
}
-(void)showError
{
    if(self.box!=nil)
    {
        [self.box alert:@"网络请求失败"];
    }
    else{NSLog(@"网络请求失败");}
}

@end
