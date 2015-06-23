//
//  VZHTTPRequestGenerator.h
//  ETLibSDK
//
//  Created by moxin.xt on 12-12-18.
//  Copyright (c) 2013年 VizLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSString* (^VZHTTPRequestStringGeneratorBlcok)(NSURLRequest* request,NSDictionary* params,NSError *__autoreleasing *error);

@interface VZHTTPRequestGenerator : NSObject

@property(nonatomic,assign) NSStringEncoding stringEncoding;
@property(nonatomic,copy)   VZHTTPRequestStringGeneratorBlcok queryStringGenerator;

- (NSURLRequest *)generateRequestWithURLString:(NSString *)aURLString
                                        Params:(NSDictionary *)aParams
                                    HTTPMethod:(NSString* )httpMethod
                               TimeoutInterval:(NSTimeInterval)timeoutInterval;

@end



