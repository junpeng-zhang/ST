//
//  STDate.h
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(ST)
-(NSString*)toString:(NSString*)formatter;
-(NSString*)toString;
+(NSDateComponents *)now;
+(NSDate *)beiJinDate;
@end
@interface NSDateComponents(ST)
-(NSString*)toString:(NSString*)formatter;
-(NSString*)toString;
@end

