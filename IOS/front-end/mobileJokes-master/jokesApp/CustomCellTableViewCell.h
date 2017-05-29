//
//  CustomCellTableViewCell.h
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-03-02.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *comment;

@end
