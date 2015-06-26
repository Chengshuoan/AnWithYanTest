//
//  Test1.h
//  test
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
 typedef void(^CallBack)(int x,int y);

@interface Test1 : NSObject

+ (void)getNumber:(CallBack)callBack;

@end
