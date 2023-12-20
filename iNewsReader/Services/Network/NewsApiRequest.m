//
//  NewsApiRequest.m
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import "NewsApiRequest.h"
#import "AppConstants.h"
#import "Api.h"

#define pageSize @"10"


@interface NewsApiRequest()

@property (nonatomic) HTTPMethod method;
@property (nonatomic, copy) NSURL *baseURL;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSDictionary *parameters;
@property (nonatomic, copy) NSDictionary *headers;

@end
@implementation NewsApiRequest
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (HTTPMethod)method
{
    return  GET;
}
-(NSURL *)baseURL
{
    return [NSURL URLWithString: serverUrl];
}
- (NSString *)path
{
    return APIEndpointString(ALL);
}
- (NSDictionary *)parameters
{
//    [NSString stringWithFormat:@"%@everything?q=*&apiKey=%@&pageSize=%@&page=%i",serverUrl,apiKey,pageSize,page]
    return @{@"q":@"*",@"apiKey":apiKey,@"pageSize":pageSize,@"page":[NSString stringWithFormat:@"%li",(long)self.page]};
}


@end


