//
//  userdetail.h
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userdetail : UIViewController
{
  //  IBOutlet UITextField *userid;

    IBOutlet UILabel *username;

    IBOutlet UILabel *firstname;
    IBOutlet UILabel *lastname;
    IBOutlet UILabel *emailid;
    IBOutlet UILabel *language;
    IBOutlet UILabel *aboutme;
    IBOutlet UILabel *numberjokes;
}
@property (nonatomic,retain) NSString *myString;

@end
