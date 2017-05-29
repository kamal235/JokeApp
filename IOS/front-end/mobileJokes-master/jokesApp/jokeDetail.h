//
//  jokeDetail.h
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellTableViewCell.h"

@interface jokeDetail : UIViewController <UITableViewDataSource,UITableViewDelegate>

{
IBOutlet UIScrollView *scroller;
   
    __weak IBOutlet UILabel *jdetail;
   
    __weak IBOutlet UILabel *jposted;
   
    __weak IBOutlet UILabel *jjoke;
}
@property (strong, nonatomic) IBOutlet UITableView *table;

@property (nonatomic,retain) NSString *myString;
@property (nonatomic,retain) NSString *myString2345;
@property (nonatomic,retain) NSArray *myTitleArray;
@property (nonatomic,retain) NSArray *myTitleArray2;
@property (nonatomic,retain) NSArray *mySubTitleArray;
@property (nonatomic,retain) NSArray *mySubTitleArray23;

@end
