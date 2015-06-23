//
//  VZHTTPRequestGenerator.h
//  ETLibSDK
//
//  Created by moxin.xt on 12-12-18.
//  Copyright (c) 2013年 VizLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VZHTTPNetworkConfig.h"


typedef NSString* (^VZHTTPRequestStringGeneratorBlcok)(NSURLRequest* request,NSDictionary* params,NSError *__autoreleasing *error);
@interface VZHTTPRequestGenerator : NSObject

+(instancetype) generator;
#import "VZHTTPNetworkConfig.h"
@property(nonatomic,copy) VZHTTPRequestStringGeneratorBlcok queryStringGenerator;

- (NSURLRequest *)generateRequestWithConfig:(VZHTTPRequestConfig) config
                                         URLString:(NSString *)aURLString
                                            Params:(NSDictionary *)aParams;


@end



