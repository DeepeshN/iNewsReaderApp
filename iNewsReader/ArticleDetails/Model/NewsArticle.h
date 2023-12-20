//
//  NewsArticle.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ArticleDetails;

@interface NewsArticle : NSObject
{
    NSString *title,*details,*publishedDate,*metaData;
    NSURL *url;
}
@property (nonatomic, readonly, nullable)   NSString *title;
@property (nonatomic, readonly, nullable)   NSString *details;
@property (nonatomic, readonly, nullable)   NSURL *articleImageUrl;
@property (nonatomic, readonly, nullable)   NSString *articleLink;
@property (nonatomic, readonly, nullable)   NSString *publishedDate;
@property (nonatomic, readonly, nullable)   NSAttributedString *metaData;

- (id)initWithArticle:(nonnull ArticleDetails*)articleDetails;

@end

NS_ASSUME_NONNULL_END
