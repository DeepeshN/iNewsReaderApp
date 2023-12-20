//
//  ArticleDetails.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "ArticleDetails.h"
@interface ArticleDetails (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end
@implementation ArticleDetails
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"title": @"title",
        @"description": @"theDescription",
        @"url": @"url",
        @"urlToImage": @"urlToImage",
        @"publishedAt": @"publishedAt",
        @"content": @"content",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ArticleDetails alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ArticleDetails.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = ArticleDetails.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ArticleDetails.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in ArticleDetails.properties) {
        id propertyName = ArticleDetails.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end


