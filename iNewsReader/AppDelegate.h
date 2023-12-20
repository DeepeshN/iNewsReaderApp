//
//  AppDelegate.h
//  iNewsReader
//
//  Created by MacbookPro on 11/12/23.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

