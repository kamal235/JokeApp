//
//  jokesByCategory.h
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jokesByCategory : UIViewController <UITableViewDataSource,UITableViewDelegate>
{}


@property (nonatomic,retain) NSString *myString;

@property (nonatomic,retain) NSArray *myTitleArray;
@property (nonatomic,retain) NSArray *myTitleArray2;
@property (nonatomic,retain) NSArray *mySubTitleArray;
//@property (strong, nonatomic) IBOutlet UILabel *label;
//@property (strong, nonatomic) NSString *labelstring;
@property (strong, nonatomic) NSString *url2;

//@property (strong, nonatomic) IBOutlet UILabel *myLabel;

//@property (strong, nonatomic) IBOutlet NSString *myGlobalLabel;

@end
