//
//  HomeViewModel.m
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import "HomeViewModel.h"
#import "NewsArticle.h"
#import "ArticleResult.h"
#import "NewsApi.h"
#import "ArticleDetailsViewModel.h"
@interface HomeViewModel ()

@property (nonatomic, strong) id<FetchArticleProtocol> apiService;
@property (nonatomic, strong) NSArray<NewsArticle *> *articles;

@property(assign,nonatomic) NSInteger page;
@property(assign,nonatomic) Boolean isFetchingArticle;

@end

@implementation HomeViewModel

- (instancetype)initWith: (id<FetchArticleProtocol>) apiService
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.isFetchingArticle = false;
        self.articles = @[];
        self.apiService = apiService;//[[NewsApi alloc] init];
    }
    return self;
}
- (void)getLatestNews:(void (^)(NSArray<NewsArticle*> *newsArticle))successCompletion error:(void (^)(NSError *error))errorCompletion;
{
    if ([self.articles count] < 100 && self.isFetchingArticle == false)
    {
        self.isFetchingArticle = true;
        __weak HomeViewModel *weakSelf = self;
        
        [self.apiService getLatestNewsAtPage:weakSelf.page OfArticle:^(ArticleResult * _Nullable result, NSError * _Nullable error) {
            NSMutableArray<NewsArticle*> *newsArticleResult = [[NSMutableArray alloc]init];
            for (ArticleDetails *article in result.articles) {
                [newsArticleResult addObject:[[NewsArticle alloc] initWithArticle:article]];
            }
            weakSelf.articles = [weakSelf.articles arrayByAddingObjectsFromArray:newsArticleResult];
            weakSelf.isFetchingArticle = false;
            weakSelf.page += 1;
            successCompletion(weakSelf.articles);
        }];
    }
}

- (NSUInteger)numberOfItems {
    return self.articles.count;
}

- (NSUInteger)numberOfSections {
    return 1;
}

- (NewsArticle *)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    if (index >= self.articles.count) {
        return nil;
    }
    return self.articles[indexPath.row];
}
- (nullable ArticleDetailsViewModel *)detailsViewModel:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    if (index >= self.articles.count) {
        return nil;
    }
    return  [[ArticleDetailsViewModel alloc] initWithArticle: self.articles[indexPath.row]];
}

@end
