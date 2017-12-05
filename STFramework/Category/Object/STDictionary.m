//
//  STDictionary.m
//  IT恋
//
//  Created by 陈裕强 on 2017/12/1.
//  Copyright © 2017年 Silan Xie. All rights reserved.
//

#import "STDictionary.h"

@implementation NSMutableDictionary(ST)

-(BOOL)has:(NSString*)key{
    return self[key]!=nil;
}
@end
@implementation NSDictionary(ST)

-(BOOL)has:(NSString*)key{
    return self[key]!=nil;
}
-(NSString*)toJson{
    NSString *json = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (!jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }
    else
    {
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return json;
}

@end
