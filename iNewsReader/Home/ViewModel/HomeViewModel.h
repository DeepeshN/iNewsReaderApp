//
//  HomeViewModel.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsApi.h"
@class NewsArticle;
@class ArticleDetailsViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol ArticleProtocol <NSObject>

- (void)getLatestNews:(void (^)(NSArray<NewsArticle*> *newsArticle))successCompletion error:(void (^)(NSError *error))errorCompletion;
- (NSUInteger)numberOfItems;
- (NSUInteger)numberOfSections;
- (nullable NewsArticle *)itemAtIndexPath:(NSIndexPath *)indexPath;
- (nullable ArticleDetailsViewModel *)detailsViewModel:(NSIndexPath *)indexPath;


@end


@interface HomeViewModel : NSObject<ArticleProtocol>
- (instancetype)initWith: (id<FetchArticleProtocol>) apiService;

@end

NS_ASSUME_NONNULL_END
