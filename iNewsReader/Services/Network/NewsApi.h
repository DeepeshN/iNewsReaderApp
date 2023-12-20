//
//  NewsApi.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <Foundation/Foundation.h>
#import "NewsApiProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface NewsApi : NSObject<FetchArticleProtocol>

@end

NS_ASSUME_NONNULL_END
