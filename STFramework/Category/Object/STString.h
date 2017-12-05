//
//  STNSString.h
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString(ST)

-(NSString*)reverse;
-(BOOL)isInt;
-(BOOL)isFloat;
-(NSString*)append:(NSString*)string;
-(NSString*)replace:(NSString*)a with:(NSString*)b;
-(NSString *)replace:(NSString *)a with:(NSString *)b isCase:(BOOL)isCase;
-(NSArray<NSString*>*)split:(NSString*)separator;
-(NSString*)toUpper;
-(NSString*)toLower;
-(BOOL)startWith:(NSString*)value;
-(BOOL)endWith:(NSString*)value;
-(BOOL)contains:(NSString*)value;
-(BOOL)contains:(NSString*)value isCase:(BOOL)isCase;
-(BOOL)isEmpty;
+(BOOL)isNilOrEmpty:(NSString*)value;
+(NSString*)toString:(id)value;
-(NSString*)trim;


-(NSInteger)indexOf:(NSString*)searchString;
-(NSInteger)indexOf:(NSString*)searchString isCase:(BOOL)isCase;
-(NSString*)firstCharUpper;
-(NSString*)firstCharLower;
@end
