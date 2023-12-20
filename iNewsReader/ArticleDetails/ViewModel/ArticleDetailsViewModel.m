//
//  ArticleDetailsViewModel.m
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//
#import "NewsArticle.h"
#import "ArticleDetailsViewModel.h"
@interface ArticleDetailsViewModel ()

//@property (nonatomic, strong) NewsArticle  *article;

@end
@implementation ArticleDetailsViewModel
- (id)initWithArticle:(nonnull NewsArticle*)articleDetails
{
    if (self = [super init]) {
        self.article = articleDetails;
    }
    return self;
}
- ( NewsArticle *)getArticle
{
    return  self.article;
}
@end
