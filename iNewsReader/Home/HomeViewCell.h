//
//  HomeViewCell.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NewsArticle;

@interface HomeViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *publishedDate;
@property (weak, nonatomic) IBOutlet UILabel *content;

- (void)setArticle:(nullable NewsArticle*)article;

@end

NS_ASSUME_NONNULL_END
