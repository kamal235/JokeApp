//
//  allusers.h
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface allusers : UIViewController <UITableViewDataSource,UITableViewDelegate>
{}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myMenu;

@property (nonatomic,retain) NSString *myString;

@property (nonatomic,retain) NSArray *myTitleArray;
@property (nonatomic,retain) NSArray *myTitleArray2;
@property (nonatomic,retain) NSArray *mySubTitleArray;

@end
