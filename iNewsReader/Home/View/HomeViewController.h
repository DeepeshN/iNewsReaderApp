//
//  ViewController.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <UIKit/UIKit.h>
@class HomeViewModel;
@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *articleList;
- (void)setHomeListViewModel:(nullable HomeViewModel*)viewModel;

@end

