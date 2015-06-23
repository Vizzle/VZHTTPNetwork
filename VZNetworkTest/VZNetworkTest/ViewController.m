//
//  ViewController.m
//  VZNetworkTest
//
//  Created by moxin on 15/5/10.
//  Copyright (c) 2015年 VizLab. All rights reserved.
//

#import "ViewController.h"
#import "VZHTTPNetwork.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        
        case 0:
            [self testRunloop];
            break;
        
        case 1:
            [self testURLConnection];
            break;
            
        case 2:
            [self testHTTPConnection];
            break;
    
        case 3:
            [self testHTTPs];
            break;
            
        case 4:
            [self testGET];
            break;
            
        case 5:
            [self testPOST];
            break;
            
        default:
            break;
    }
}
- (void)testRunloop {
    
    for (int i=0; i<10; i++) {
        
        VZHTTPRunloopOperation* operation = [VZHTTPRunloopOperation new];
       [[VZHTTPNetworkAgent sharedInstance].operationQueue addOperation:operation];
        
        [operation performSelector:@selector(cancel) withObject:nil afterDelay:1.0f];
        
    }
    
}
- (void)testURLConnection {
    
    for (int i=0; i<10; i++) {
        
        int index = i;
        NSString* url =  [NSString stringWithFormat:@"https://api.github.com/users?since=%i",index];
        
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        VZHTTPURLConnectionOperation* operation = [[VZHTTPURLConnectionOperation alloc]initWithRequest:request];
        
        [operation setCompletionBlock:^{
           
            NSLog(@"finished:%@",[[request.URL absoluteString] substringFromIndex:url.length-2]);
            
            
        }];
        [[VZHTTPNetworkAgent sharedInstance].operationQueue addOperation:operation];
        
    }
    
}
- (void)testHTTPConnection{
    
    for (int i=0; i<10; i++) {
        
        int index = i;
        NSString* url =  [NSString stringWithFormat:@"https://api.github.com/users?since=%i",index];
        
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        VZHTTPConnectionOperation* operation = [[VZHTTPConnectionOperation alloc]initWithRequest:request];
        [operation setCompletionHandler:^(VZHTTPURLConnectionOperation* op,NSString *responseString, id responseObj, NSError *error) {
           
              NSLog(@"finished:%@",[[op.request.URL absoluteString] substringFromIndex:url.length-2]);
            
        }];
        [[VZHTTPNetworkAgent sharedInstance].operationQueue addOperation:operation];
        
    }
}

- (void)testHTTPs
{

}


- (void)testGET
{
    int index = 10;
    NSString* url =  [NSString stringWithFormat:@"https://api.github.com/users?since=%i",index];
    [[VZHTTPNetworkAgent sharedInstance] HTTP:url completionHandler:^(VZHTTPConnectionOperation *connection, NSString *responseString, id responseObj, NSError *error) {
       
        NSLog(@"responseString:%@",responseString);
    }];
}

- (void)testPOST
{
//    VZHTTPRequestConfig config = vz_defaultHTTPRequestConfig();
//    config.requestMethod = VZHTTPMethodPOST;
//    [[VZHTTPNetworkAgent sharedInstance] HTTP:@"http://192.168.1.110:8080/baseservice/login" requestConfig:config responseConfig:vz_defaultHTTPResponseConfig() params:@{@"mobile":@"15558015022",@"passwd":@"123456",@"countryCode":@"86"} completionHandler:^(VZHTTPConnectionOperation *connection, NSString *responseString, id responseObj, NSError *error) {
//        
//        NSLog(@"%@",responseString);
//        
//    }];
    
}


@end