//
//  FirstViewController.h
//  test
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)(void);


@interface FirstViewController : UIViewController

- (void)changeValue:(Block)block;


@end
