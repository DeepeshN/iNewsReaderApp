//
//  HomeListViewModelTest.m
//  iNewsReaderTests
//
//  Created by MacbookPro on 12/12/23.
//


#import <XCTest/XCTest.h>
#import "HomeViewModel.h"
#import "NewsFetcherServiceMock.h"

@interface HomeListViewModelTest : XCTestCase
@property (nonatomic, strong) id<FetchArticleProtocol> newsFetcher;
@property (nonatomic, strong) HomeViewModel * viewModel;
@end

@implementation HomeListViewModelTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.newsFetcher = [[NewsFetcherServiceMock alloc]init];
    self.viewModel = [[HomeViewModel alloc]initWith:self.newsFetcher];
}

- (void)testGetData_success {
    
    NewsFetcherServiceMock *service = self.newsFetcher;
    service.isForFailure = false;
    XCTestExpectation *expection = [self expectationWithDescription:@"newsList"];
    [self.viewModel getLatestNews:^(NSArray<NewsArticle *> * _Nonnull newsArticle) {
        [expection fulfill];
    } error:^(NSError * _Nonnull error) {
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
           
        }];
    XCTAssertFalse([self.viewModel numberOfItems] == 0);
    
}
- (void)testGetData_failure {

    NewsFetcherServiceMock *service = self.newsFetcher;
    service.isForFailure = true;
    XCTestExpectation *expection = [self expectationWithDescription:@"newsList"];
    [self.viewModel getLatestNews:^(NSArray<NewsArticle *> * _Nonnull newsArticle) {
        [expection fulfill];
    } error:^(NSError * _Nonnull error) {
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
           
        }];
    XCTAssertFalse([self.viewModel numberOfItems] == 0);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

