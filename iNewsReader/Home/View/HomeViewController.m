//
//  ViewController.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "ArticleDetailsViewController.h"
#import "NewsApi.h"
#import "ArticleResult.h"
#import "HomeViewModel.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HomeViewModel * viewModel;
@end

@implementation HomeViewController
//@synthesize viewModel;
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}
- (void)setHomeListViewModel:(nullable HomeViewModel*)viewModel
{
    self.viewModel = viewModel;
}


- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    [self fetchArticle];
   
}
- (void)fetchArticle {
    __weak HomeViewController *weakSelf = self;
    [self.viewModel getLatestNews:^(NSArray<NewsArticle *> * _Nonnull newsArticle) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.articleList reloadData];
        });
    } error:^(NSError * _Nonnull error) {
        
    }];
//    [_api getLatestNewsAtPage:self.page OfArticle:^(ArticleResult * _Nullable result) {
//        self.isFetchingArticle = false;
//        NSLog(@"count %i %i",[self.articles count],[result.articles count]);
//        self.articles = [self.articles arrayByAddingObjectsFromArray:result.articles];
//       
//        dispatch_async(dispatch_get_main_queue(), ^
//                       {
//            [self.articleList reloadData];
//                       });
//        
//    } ];
}
#pragma mark - Table view data source


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 1.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleDetailsViewController *articleDetailsView = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleDetailsViewController"];
    [articleDetailsView articleViewModel:[self.viewModel detailsViewModel:indexPath]];
    [self.navigationController pushViewController:articleDetailsView animated:YES];


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"HomeViewCellId"];
    [cell setArticle:[self.viewModel itemAtIndexPath:indexPath]];
     [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return   [self.viewModel numberOfItems];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfSections];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    Boolean reachedToPageEnd = (index == ([self.viewModel numberOfItems] - 1));
    NSLog(@"index %i",index);
    if (reachedToPageEnd == true) {
        [self fetchArticle];
    }
}

@end
