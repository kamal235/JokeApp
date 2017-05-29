//
//  userdetail.m
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "userdetail.h"

@interface userdetail ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation userdetail

- (void)viewDidLoad {
   // self.activityIndicator.hidden=NO;
    [self.activityIndicator startAnimating];
    [super viewDidLoad];
    
    NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/getuserdetail&%@",_myString];
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        if (data.length>0 && error == nil) {
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
          
           // NSString *longName;
            
           
            if ([[myMainJsonObject allKeys] containsObject:@"userName"])
            {
                NSString *username1=[myMainJsonObject objectForKey:@"userName"];
                username.text=username1;
                
            }
            
            if ([[myMainJsonObject allKeys] containsObject:@"firstName"])
            {
                NSString *first_name=[myMainJsonObject objectForKey:@"firstName"];
                firstname.text=first_name;
            }
            
            if ([[myMainJsonObject allKeys] containsObject:@"lastName"])
            {
                
                NSString *last_name=[myMainJsonObject objectForKey:@"lastName"];
                lastname.text=last_name;
            }
            
            if ([[myMainJsonObject allKeys] containsObject:@"language1"])
            {
                NSString *lang=[myMainJsonObject objectForKey:@"language1"];
                language.text=lang;
            }
            
            if ([[myMainJsonObject allKeys] containsObject:@"about_me"])
            {
                NSString *abt=[myMainJsonObject objectForKey:@"about_me"];
                aboutme.text=abt;
            }
            
            
            
            if ([[myMainJsonObject allKeys] containsObject:@"num_of_joke_posted_by_User"])
            {
                NSString *num=[[myMainJsonObject objectForKey:@"num_of_joke_posted_by_User"]stringValue];
                numberjokes.text=num;
            }
           
            if ([[myMainJsonObject allKeys] containsObject:@"email"])
            {
                NSString *email=[myMainJsonObject objectForKey:@"email"];
                emailid.text=email;
            }
            
            
            
          
            
            
            
        }
       [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden=YES;
        
    }]resume];
    
    
    
    
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
