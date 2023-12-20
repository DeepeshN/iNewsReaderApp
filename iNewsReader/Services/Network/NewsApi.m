//
//  NewsApi.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "NewsApi.h"
#import "AppConstants.h"
#import "ArticleResult.h"
#import "NewsApiRequest.h"
#import "ApiClient.h"
#define pageSize @"10"

@interface NewsApi()
@property(strong,nonatomic)NewsApiRequest *api;
@end

@implementation NewsApi
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.api = [[NewsApiRequest alloc]init];
    }
    return self;
}
-(void)getLatestNewsAtPage:(NSInteger) page OfArticle:(void (^)(ArticleResult * __nullable result, NSError * _Nullable error ))completionHandler
{
    self.api.page = page;
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    NSURLSessionDataTask *dataTask = [session dataTaskWithAPIRequest:self.api completion:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response, NSError * _Nonnull error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
          NSError *parseError = nil;
//          NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            ArticleResult *result = [ArticleResult fromData:data error:&error];
            completionHandler(result,nil);
        }
        else
        {
          NSLog(@"Error %@",error);
            completionHandler(nil,error);
        }
          [session finishTasksAndInvalidate];
      }];
    [dataTask resume];
}

@end
