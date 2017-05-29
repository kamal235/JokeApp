//
//  profile.m
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-03-04.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "profile.h"

@interface profile ()

@end

@implementation profile

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *url=@"https://lh3.googleusercontent.com/UfVVMqSjePrsCP6Gg6XvHgsmTVlxyYfz9rQiXgjtAcamMRx6aibvK-i-6kIOHgd0KmNt_cc=s85";
    
    
    
    
    
    
     imagetest= [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
