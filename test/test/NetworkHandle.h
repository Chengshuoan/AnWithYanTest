//
//  NetworkHandle.h
//  test
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class NetworkHandle;
@protocol ImageDownloadDelegate <NSObject>

- (void)downloader:(NetworkHandle *)downloader didFinishLoading:(UIImage *)img;

@end


typedef void(^CallBack) (id);

@interface NetworkHandle : NSObject

@property (nonatomic,copy) CallBack callBack;

- (void)getProductListWithUrlStr:(NSString *)urlStr competion:(CallBack)callBack;

+ (void)downloadImageWithURLString:(NSString *)urlStr delegate:(id<ImageDownloadDelegate>)delegate;

@end
