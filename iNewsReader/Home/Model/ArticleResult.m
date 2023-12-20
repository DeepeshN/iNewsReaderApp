//
//  ArticleResult.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "ArticleResult.h"
#import "ArticleDetails.h"
// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })


@interface ArticleResult (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

ArticleResult *_Nullable NewsWelcomeFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [ArticleResult fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

ArticleResult *_Nullable NewsWelcomeFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return NewsWelcomeFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable NewsWelcomeToData(ArticleResult *welcome, NSError **error)
{
    @try {
        id json = [welcome JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable NewsWelcomeToJSON(ArticleResult *welcome, NSStringEncoding encoding, NSError **error)
{
    NSData *data = NewsWelcomeToData(welcome, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation ArticleResult
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"status": @"status",
        @"totalResults": @"totalResults",
        @"articles": @"articles",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return NewsWelcomeFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return NewsWelcomeFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ArticleResult alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _articles = map(_articles, λ(id x, [ArticleDetails fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ArticleResult.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = ArticleResult.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ArticleResult.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"articles": map(_articles, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return NewsWelcomeToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return NewsWelcomeToJSON(self, encoding, error);
}
@end
