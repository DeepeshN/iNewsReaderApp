//
//  Api.h
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, APIEndpoint){
    ALL, TOP
};

extern NSString *APIEndpointString(APIEndpoint method);


NS_ASSUME_NONNULL_END
