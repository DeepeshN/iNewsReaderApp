//
//  Api.m
//  iNewsReader
//
//  Created by MacbookPro on 12/12/23.
//

#import "Api.h"


NSString *APIEndpointString(APIEndpoint method) {
    switch (method) {
        case ALL:       return @"everything";
        case TOP:      return @"top-headlines";
        default:        return nil;
    }
}
