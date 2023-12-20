//
//  WebView.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebView : UIViewController<UIWebViewDelegate>
{
    
    UIActivityIndicatorView *activity;
}
@property(strong ,nonatomic)IBOutlet UIWebView *website;
@property(strong,nonatomic)NSString *websitelink;
-(void)loadWebPageWithUrl:(NSString*)url;
@end


NS_ASSUME_NONNULL_END
