//
//  ArticleDetailsViewController.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ArticleDetailsViewModel;
@interface ArticleDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UILabel *link;
- (void)articleViewModel:(nullable ArticleDetailsViewModel*)viewModel;

@end

NS_ASSUME_NONNULL_END
