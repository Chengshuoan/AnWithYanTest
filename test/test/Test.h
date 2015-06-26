//
//  Test.h
//  test
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Finish)(void);
@interface Test : NSObject

+ (void)chargeMyIphone:(Finish)finish;

@end
