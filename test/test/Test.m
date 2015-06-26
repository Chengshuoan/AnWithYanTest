//
//  Test.m
//  test
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Test.h"



@implementation Test


+ (void)chargeMyIphone:(Finish)finish
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"电冲好了");
        finish();
    });
    
    
}



@end
