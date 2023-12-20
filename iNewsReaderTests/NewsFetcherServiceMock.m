//
//  NewsFetcherServiceMock.m
//  iNewsReaderTests
//
//  Created by MacbookPro on 12/12/23.
//

#import "NewsFetcherServiceMock.h"
#import "ArticleResult.h"
@interface NewsFetcherServiceMock()
@end
@implementation NewsFetcherServiceMock
@synthesize isForFailure;
- (void)getLatestNewsAtPage:(NSInteger)page OfArticle:(void (^)(ArticleResult * _Nullable, NSError * _Nullable))completionHandler
{
    NSData *data = [self JSONFromFile];
    NSError *customError = [NSError errorWithDomain:@"Custom error" code:1234 userInfo:nil];
    NSError *error;
    ArticleResult *result = [ArticleResult fromData:data error:&error];
    if (isForFailure == false)
    {
        completionHandler(result,nil);
    }
    else
    {
        completionHandler(nil,customError);
    }
}
- (id)JSONFromFile
{
    NSBundle *bundle = [NSBundle bundleForClass:[NewsFetcherServiceMock class]];
    NSString *path = [bundle pathForResource:@"NewsList" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSLog(@"data %@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    return data;
}
@end
