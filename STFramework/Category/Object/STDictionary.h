//
//  STDictionary.h
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary(ST)
-(BOOL)has:(NSString*)key;
@end

@interface NSDictionary(ST)
-(BOOL)has:(NSString*)key;
-(NSString*)toJson;
@end
