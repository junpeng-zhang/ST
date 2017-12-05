//
//  STUserDefaults.m
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import "STUserDefaults.h"


@implementation NSUserDefaults(ST)

+(NSString *)get:(NSString *)key
{
    NSUserDefaults *data=[NSUserDefaults standardUserDefaults];
    return [data valueForKey:key];
}

+(void)set:(NSString *)key v:(NSString *)value
{
    NSUserDefaults *data=[NSUserDefaults standardUserDefaults];
    return [data setValue:value forKey:key];
}
+(BOOL)has:(NSString *)key
{
    return [self get:key]!=nil;
    
}
@end
