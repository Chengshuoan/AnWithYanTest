//
//  NetworkHandle.m
//  test
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NetworkHandle.h"

@implementation NetworkHandle

- (void)getProductListWithUrlStr:(NSString *)urlStr competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    __weak NetworkHandle *handler = self;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        if (!data) {
            return;
        }
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        handler.callBack(arr);
        
    }];
    
    
    
}
- (void)getDetailWithUrl:(NSString *)strUrl competion:(CallBack)callBack
{
    NSURL *url = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    callBack(dic);
}

+(void)downloadImageWithURLString:(NSString *)urlStr delegate:(id<ImageDownloadDelegate>)delegate
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            UIImage *img = [UIImage imageWithData:data];
            if (delegate&&[delegate performSelector:@selector(downloader:didFinishLoading:)]) {
                [delegate downloader:nil didFinishLoading:img];
            }
            
            
        }
    }];
    
    
}

@end
