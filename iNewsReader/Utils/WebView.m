//
//  WebView.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "WebView.h"

@interface WebView ()

@end

@interface WebView ()

@end

@implementation WebView
@synthesize websitelink,website;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activity stopAnimating];
    if ([[websitelink substringToIndex:8]isEqualToString:@"https://"])
    {
        websitelink=[websitelink stringByReplacingOccurrencesOfString:@"https://" withString:@"http://"];
        NSURL *url = [NSURL URLWithString:websitelink];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [website loadRequest:requestObj];
    }
    [activity removeFromSuperview];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{   
    [activity startAnimating];
}
-(void)stopAnimate
{
    [activity stopAnimating];
    [activity removeFromSuperview];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self performSelector:@selector(stopAnimate) withObject:nil afterDelay:4];
}

-(void)loadWebPageWithUrl:(NSString*)url
{
    websitelink=@"https://";
    if (url.length==0||url==nil)
    {
        return;
    }
    websitelink=url;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [activity setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [activity setCenter:website.center];
    [website addSubview:activity];
    // self.title=@"Website";
    website.scalesPageToFit = YES;
    website.autoresizesSubviews = YES;
    
    websitelink=[websitelink stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",websitelink);
    if (![[websitelink substringToIndex:8]isEqualToString:@"https://"]&&![[websitelink substringToIndex:7]isEqualToString:@"http://"]) {
        websitelink=[@"https://" stringByAppendingString:websitelink];
    }
    NSLog(@"link %@",websitelink);
    NSURL *url = [NSURL URLWithString:websitelink];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [website loadRequest:requestObj];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    if ([self.websitelink stringByReplacingOccurrencesOfString:@" " withString:@""].length==0)
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Not Available"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            [self.navigationController popViewControllerAnimated:YES];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [website setDelegate:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
