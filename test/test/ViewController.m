//
//  ViewController.m
//  test
//
//  Created by lanou3g on 15/6/6.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Test.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController
/**
 *  1.我现在玩手机
 2.突然手机没有电了
 3.我只好让手机开始充电
 4.充电的过程中我好无聊，我要去看电视，但是我不会一直看电视，我要等手机电充满了停止看电视，继续去玩手机
 5.我开始看电视
 6.手机电充好了，我听到手机响了一下，我不看电视了我继续去玩手机。
 */
-(void)loadView{
    [super loadView];
    
    NSLog(@"我在玩手机");
    NSLog(@"手机没电了");
//    [Test chargeMyIphone:^{
//        NSLog(@"我要出去逛逛");
//    }];
//    [self chargeMyIphone:^{
//        NSLog(@"woyaoguangjie");
//    }];
    
    FirstViewController * firstVC = [[FirstViewController alloc]init];
    [firstVC changeValue:^(void) {
        NSLog(@"玩。。。。");
    }];
    
    NSLog(@"我在看电视");
    [NetworkHandle downloadImageWithURLString:@"asdfads" delegate:self];

}
/**
 *  第一个void表示此block无返回值 (^)为block type的标志 第二个(void)表示这个block无参数。finishBlock就是他的名字。无参数无返回类型的匿名。无参数无返回值类型的匿名函数就是我们的最简单的block了！他非常方便我们用来回调，因为它没有返回值，没有参数，就相当于只有内部的可执行代码
     而我们将一个固定的事件用一段代码作为参数传了进来，并且以名字（）形式来触发它，那么这个函数的结尾就不会总是玩手机了！那么他可以是任何事情
 *
 *  @param finishBlock <#finishBlock description#>
 */
-(void)chargeMyIphone:(void(^)(void))finishBlock
{
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"电充好了");
        finishBlock();
    });

//    [NSThread sleepForTimeInterval:10];
//    NSLog(@"电充好了");
    
}

- (void)downloader:(NetworkHandle *)downloader didFinishLoading:(UIImage *)img
{
    
}
@end
