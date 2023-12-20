//
//  ApiClient.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>
#import "ApiRequestProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^APIClientCompletionBlock)(NSData *data, NSURLResponse *response, NSError *error);

@protocol ApiClient <NSObject>

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:(id<APIRequest2>)request
                                      completion:(APIClientCompletionBlock)completion;

@end
@interface ApiClient : NSObject

@end
@interface NSURLSession(ApiClient) <ApiClient>

@end

NS_ASSUME_NONNULL_END
