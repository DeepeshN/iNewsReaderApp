//
//  ApiRequestProtocol.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//
#import "HTTPMethod.h"
#import <Foundation/Foundation.h>

#ifndef ApiRequestProtocol_h
#define ApiRequestProtocol_h

@protocol APIRequest2 <NSObject>

- (HTTPMethod)method;
- (NSURL *)baseURL;
- (NSString *)path;
- (NSDictionary *)parameters;
- (NSDictionary *)headers;

@end
#endif /* ApiRequestProtocol_h */
