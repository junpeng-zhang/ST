//
//  STBaseJSONModel.h
//  STITLove
//
//  Created by dingjianjaja on 17/5/10.
//  Copyright © 2017年 随天科技. All rights reserved.
//

#import "STModelBase.h"

@interface STModel : STModelBase
@property (nonatomic, assign) BOOL success;
@property (retain, nonatomic) id<NSObject> msg;
@end


