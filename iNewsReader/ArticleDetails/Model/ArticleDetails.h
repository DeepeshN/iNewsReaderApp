//
//  ArticleDetails.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleDetails : NSObject
{
    NSString *title,*theDescription,*url,*publishedAt,*content;
}
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *theDescription;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, copy)   NSString *urlToImage;
@property (nonatomic, copy)   NSString *publishedAt;
@property (nonatomic, copy)   NSString *content;

- (id)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
