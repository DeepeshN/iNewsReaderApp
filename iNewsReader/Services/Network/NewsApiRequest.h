//
//  NewsApiRequest.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>
#import "ApiRequestProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsApiRequest : NSObject<APIRequest2>
@property(assign,nonatomic)NSInteger page;
@end

NS_ASSUME_NONNULL_END
