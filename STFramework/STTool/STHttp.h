//
//  STHttp.h
//  IT恋
//
//  Created by 陈裕强 on 2017/5/17.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STModel.h"
#import "STMessageBox.h"

typedef void(^Success)(STModel *result);
typedef void(^Error)(NSString *errMsg);

@interface STHttp : NSObject


- (instancetype)init:(STMessageBox*)box;
- (void)get:(NSString *)url paras:(NSDictionary *)paras success:(Success)success error:(Error)error;
- (void)post:(NSString *)url paras:(NSDictionary *)paras success:(Success)success error:(Error)error;
- (void)upload:(NSString *)url data:(NSData *)data success:(Success)success error:(Error)error;
- (void)upload:(NSString *)url paras:(NSDictionary *)paras success:(Success)success error:(Error)error;
- (void)setHeader:(NSString*)key v:(NSString*)value;

+ (instancetype)share;
+ (instancetype)shareWithLoading;
-(void)networkState;
@end
