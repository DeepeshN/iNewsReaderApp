//
//  NewsFetcherServiceMock.h
//  iNewsReaderTests
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>
#import "NewsApiProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsFetcherServiceMock : NSObject<FetchArticleProtocol>
@property(assign,nonatomic)    Boolean isForFailure ;

@end

NS_ASSUME_NONNULL_END
