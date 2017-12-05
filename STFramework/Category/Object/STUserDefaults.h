//
//  STUserDefaults.h
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSUserDefaults(ST)
+(void)set:(NSString*)key v:(NSString*)value;
+(NSString*)get:(NSString*)key;
+(BOOL)has:(NSString*)key;
@end
