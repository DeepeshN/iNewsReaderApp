//
//  NewsArticle.m
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import "NewsArticle.h"
#import "ArticleDetails.h"
#import <UIKit/UIKit.h>

@interface NewsArticle ()
@property (nonatomic, readwrite, nullable)  NSString *title;
@property (nonatomic, readwrite, nullable)  NSString *details;
@property (nonatomic, readwrite, nullable)  NSURL *articleImageUrl;
@property (nonatomic, readwrite, nullable)  NSString *articleLink;
@property (nonatomic, readwrite, nullable)  NSString *publishedDate;
@property (nonatomic, readwrite, nullable)  NSAttributedString *metaData;
@end


@implementation NewsArticle

- (id)initWithArticle:(nonnull ArticleDetails*)articleDetails;
{
    self = [super init];
    if (self) {
        self.title = articleDetails.title;
        self.details = articleDetails.theDescription;
        self.articleImageUrl = [[NSURL alloc]initWithString:articleDetails.urlToImage];
        self.articleLink = articleDetails.url;
        self.publishedDate = [self formateDate:articleDetails.publishedAt];
        self.metaData = [self getAttributedString:articleDetails.content];
    }
    return self;
}
-(NSAttributedString*)getAttributedString:(NSString*)htmlString
{
    NSAttributedString * attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attributedString;

}
-(NSString*)formateDate:(NSString*)dateString
{
    NSString *dateStr = @"2023-11-11T00:00:00Z";

    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *date = [dateFormat dateFromString:dateStr];

    // Convert date object to desired output format
    [dateFormat setDateFormat:@"MMMM d, YYYY , h:mm a"];
    dateStr = [dateFormat stringFromDate:date];
    
    return  dateStr;
}

@end
