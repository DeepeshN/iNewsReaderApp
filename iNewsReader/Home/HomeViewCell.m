//
//  HomeViewCell.m
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import "HomeViewCell.h"
#import "NewsArticle.h"
#import <SDWebImage/SDWebImage.h>

@implementation HomeViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setArticle:(nullable NewsArticle*)article
{
    self.title.text = article.title;
    self.publishedDate.text = article.publishedDate;
    self.content.text = article.details;
    [self.image sd_setImageWithURL:article.articleImageUrl
                 placeholderImage:[UIImage imageNamed:@"news.png"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
