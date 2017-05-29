//
//  HomeViewClass.m
//  jokesApp
//
//  Created by CEGEP GIM on 2017-03-02.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "HomeViewClass.h"
#import "SWRevealViewController.h"


@interface HomeViewClass ()

@end

@implementation HomeViewClass

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.myMenu setTarget: self.revealViewController];
        [self.myMenu setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
       }

@end
