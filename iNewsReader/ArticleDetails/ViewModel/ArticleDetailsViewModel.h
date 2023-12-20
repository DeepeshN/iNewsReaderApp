//
//  ArticleDetailsViewModel.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class NewsArticle;
@interface ArticleDetailsViewModel : NSObject
@property (nonatomic, strong) NewsArticle  *article;

- (id)initWithArticle:(nonnull NewsArticle*)articleDetails;
- ( NewsArticle *)getArticle;
@end

NS_ASSUME_NONNULL_END
