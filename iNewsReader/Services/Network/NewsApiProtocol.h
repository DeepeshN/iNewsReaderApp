//
//  NewsApiProtocol.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#ifndef NewsApiProtocol_h
#define NewsApiProtocol_h
@class ArticleResult;
@protocol FetchArticleProtocol <NSObject>

-(void)getLatestNewsAtPage:(NSInteger) page OfArticle:(void (^)(ArticleResult * __nullable result, NSError * _Nullable error ))completionHandler;

@end

#endif /* NewsApiProtocol_h */
