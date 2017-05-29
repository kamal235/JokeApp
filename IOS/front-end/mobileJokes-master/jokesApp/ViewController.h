//
//  ViewController.h
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-24.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UITextField *username;

    IBOutlet UITextField *password;
}

- (IBAction)login:(id)sender;
@property (strong, nonatomic) NSString *status23;

@end

