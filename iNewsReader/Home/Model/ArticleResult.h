//
//  ArticleResult.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <Foundation/Foundation.h>
@class ArticleDetails;
NS_ASSUME_NONNULL_BEGIN

@interface ArticleResult : NSObject
{
    NSInteger totalResults;
    NSString *status;
    ArticleDetails *articles;
}

@property (nonatomic, copy)   NSString *status;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, copy)   NSArray<ArticleDetails *> *articles;


+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;

@end

NS_ASSUME_NONNULL_END
