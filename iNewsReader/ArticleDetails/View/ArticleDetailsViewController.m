//
//  ArticleDetailsViewController.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "ArticleDetailsViewController.h"
#import "ArticleDetailsViewModel.h"
#import "WebView.h"
#import "NewsArticle.h"
#import <SDWebImage/SDWebImage.h>

@interface ArticleDetailsViewController ()

@property (nonatomic, strong) ArticleDetailsViewModel * viewModel;

@end

@implementation ArticleDetailsViewController

- (void)articleViewModel:(nullable ArticleDetailsViewModel*)viewModel
{
    self.viewModel = viewModel;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
       
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NewsArticle *article = [self.viewModel article];
    self.title = article.title;

    self.content.attributedText = article.metaData;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.link setUserInteractionEnabled:true];
    [self.link addGestureRecognizer:tapGestureRecognizer];
    
    [self.image sd_setImageWithURL:article.articleImageUrl
                 placeholderImage:[UIImage imageNamed:@"news.png"]];

}

- (void) handleTapGesture:(UITapGestureRecognizer *)recognizer
{
    NewsArticle *article = [self.viewModel article];
    WebView *web=[[WebView alloc]init];
    web.title = article.title;
    [web loadWebPageWithUrl:article.articleLink];
    [self.navigationController pushViewController:web animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
