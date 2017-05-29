//
//  ViewController.m
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-24.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "ViewController.h"
#import "loginPage.h"
#import "userdetail.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)error1234 {
    UIAlertController
    *alert
    =[
      UIAlertController
      alertControllerWithTitle:@" ALERT "
      message:@"Wrong"
      preferredStyle :UIAlertControllerStyleAlert];
    
    UIAlertAction
    *defaultAction
    =[
      UIAlertAction
      actionWithTitle:@"OK"
      style:UIAlertActionStyleDefault
      handler:^(UIAlertAction *action){}];
    
    [ alert addAction :defaultAction];
    [self presentViewController :alert animated:YES completion:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)checkst
{
    NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile&%@&%@" ,username.text,password.text];
    NSURL *url=[NSURL URLWithString:url23];
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
    
    
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         //Do whatever you want after response received
         //[self getReceivedData:data];
         
         
         if (data.length>0 && error == nil) {
             
             NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             _status23=[myMainJsonObject objectForKey:@"Status"];
             NSLog(@"original value is %@",_status23);
             NSLog(@"this is the variable value ,%@",_status23);
             //NSLog(@"this is the variable value: %@",status);
             
             
         }

     }];
    
    
    /*
    
    
    NSLog(@"url of the call is %@",url23);
    NSURLSession *mysession=[NSURLSession sharedSession];
    NSLog(@"123456789");
    
    [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        
        if (data.length>0 && error == nil) {
            
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            _status23=[myMainJsonObject objectForKey:@"Status"];
            NSLog(@"original value is %@",_status23);
            NSLog(@"this is the variable value ,%@",_status23);
            //NSLog(@"this is the variable value: %@",status);
            
            
        }
        
        
        
        
    }
      ]resume];
     */
   // return _status23;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"userprofile"])
        
    {
    }

}


/*-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"userprofile"])
        
    {
       // NSLog(@"  in segue  ");
      //  NSLog(@"value for check %@",_status23);
      //  if ([_status23 isEqualToString:@"wrong"])
        {
            
           // NSLog(@"  error dede 22  ");
            UIAlertController
            *alert
            =[
              UIAlertController
              alertControllerWithTitle:@" ALERT "
              message:@"Wrong"
              preferredStyle :UIAlertControllerStyleAlert];
            
            UIAlertAction
            *defaultAction
            =[
              UIAlertAction
              actionWithTitle:@"OK"
              style:UIAlertActionStyleDefault
              handler:^(UIAlertAction *action){}];
            
            [ alert addAction :defaultAction];
            [self presentViewController :alert animated:YES completion:nil];
            
            
        }
        
       /*
        [self checkst];
        
        NSLog(@"987654321");
        NSLog(@"check karo value %@",_status23);
        if ([_status23 isEqualToString:@"wrong"])
        {
            UIAlertController
            *alert
            =[
              UIAlertController
              alertControllerWithTitle:@" ALERT "
              message:@"Wrong"
              preferredStyle :UIAlertControllerStyleAlert];
            
            UIAlertAction
            *defaultAction
            =[
              UIAlertAction
              actionWithTitle:@"OK"
              style:UIAlertActionStyleDefault
              handler:^(UIAlertAction *action){}];
            
            [ alert addAction :defaultAction];
            [self presentViewController :alert animated:YES completion:nil];
            
            
        }
        
        
        //userdetail *myViewController = (userdetail *) segue.destinationViewController;
        //        myViewController.myString=username.text;
        //myViewController.input2=password.text;
        
        NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile&%@&%@" ,                                           username.text,password.text];
        
        NSURLSession *mysession=[NSURLSession sharedSession];
        NSLog(@"123456789");

        [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
            
            if (data.length>0 && error == nil) {
                
                NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                self.status23=[myMainJsonObject objectForKey:@"Status"];
                NSLog(@"this is the variable value ,%@",self.status23);
                //NSLog(@"this is the variable value: %@",status);
                
                NSLog(@"987654321");
                NSLog(@"check karo value %@",self.status23);
                if ([self.status23 isEqualToString:@"wrong"])
                {
                    NSLog(@"12345678901234567");
                    //NSString *status1=[myMainJsonObject objectForKey:@"message"];
                    // NSLog(@"message %@",status1);
                    UIAlertController
                    *alert
                    =[
                      UIAlertController
                      alertControllerWithTitle:@" ALERT "
                      message:@"Wrong"
                      preferredStyle :UIAlertControllerStyleAlert];
                    
                    UIAlertAction
                    *defaultAction
                    =[
                      UIAlertAction
                      actionWithTitle:@"OK"
                      style:UIAlertActionStyleDefault
                      handler:^(UIAlertAction *action){}];
                    
                    [ alert addAction :defaultAction];
                    [self presentViewController :alert animated:YES completion:nil];
                    
                }
            }
            
        
          
          
        }
          ]resume];
        
        NSLog(@"dekho   %@",self.status23);
        if ([self.status23 isEqualToString:@"wrong"]) {
          
        UIAlertController
        *alert
        =[
          UIAlertController
          alertControllerWithTitle:@" ALERT "
          message:@"Wrong123"
          preferredStyle :UIAlertControllerStyleAlert];
        
        UIAlertAction
        *defaultAction
        =[
          UIAlertAction
          actionWithTitle:@"OK"
          style:UIAlertActionStyleDefault
          handler:^(UIAlertAction *action){}];
        
        [ alert addAction :defaultAction];
        [self presentViewController :alert animated:YES completion:nil];
        }
        
        */
        
        /*
        
        NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile&%@&%@" ,                                           username.text,password.text];
        
        NSURLSession *mysession=[NSURLSession sharedSession];
        
        [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
            
            if (data.length>0 && error == nil) {
                
                NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                NSString *status=[myMainJsonObject objectForKey:@"Status"];
                //NSLog(@"this is the variable value: %@",status);
                
                 if ([status isEqualToString:@"wrong"])
                {
                    NSLog(@"this is the variable value , WRONG");
                    NSString *status1=[myMainJsonObject objectForKey:@"message"];
                    NSLog(@"message %@",status1);
                    UIAlertController
                    *alert
                    =[
                      UIAlertController
                      alertControllerWithTitle:@" ALERT "
                      message:@"Wrong"
                      preferredStyle :UIAlertControllerStyleAlert];
                    
                    UIAlertAction
                    *defaultAction
                    =[
                      UIAlertAction
                      actionWithTitle:@"OK"
                      style:UIAlertActionStyleDefault
                      handler:^(UIAlertAction *action){}];
                    
                    [ alert addAction :defaultAction];
                    [self presentViewController :alert animated:YES completion:nil];
                    
                }
                else if ([status isEqualToString:@"ok"]) {
                    loginPage *myViewController = (loginPage *) segue.destinationViewController;
                    // myViewController.myGlobalLabel=self.myString;
                    myViewController.input1=username.text;
                    myViewController.input2=password.text;
                    
                }
                
                
            }
            
            
            
        }]resume];
         
         */
        /*
        
        UIAlertController
        *alert
        =[
          UIAlertController
          alertControllerWithTitle:@" ALERT "
          message:@"test"
          preferredStyle :UIAlertControllerStyleAlert];
        
        UIAlertAction
        *defaultAction
        =[
          UIAlertAction
          actionWithTitle:@"OK"
          style:UIAlertActionStyleDefault
          handler:^(UIAlertAction *action){}];
        
        [ alert addAction :defaultAction];
        [self presentViewController :alert animated:YES completion:nil];
         */
        
       /* NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile                                                                                                                                &%@&%@",username.text,password.text];
        
        
        NSURLSession *mysession=[NSURLSession sharedSession];
        [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
            if (data.length>0 && error == nil) {
                NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                NSString *status=[[myMainJsonObject objectForKey:@"Status"]stringValue];
                if ([status isEqualToString:@"ok"]) {
                    loginPage *myViewController = (loginPage *) segue.destinationViewController;
                    // myViewController.myGlobalLabel=self.myString;
                    myViewController.input1=username.text;
                    myViewController.input2=password.text;
                    
                }
                else if ([status isEqualToString:@"wrong"])
                {
                    NSString *status1=[[myMainJsonObject objectForKey:@"message"]stringValue];
                    
                    UIAlertController
                    *alert
                    =[
                      UIAlertController
                      alertControllerWithTitle:@" ALERT "
                      message:status1
                      preferredStyle :UIAlertControllerStyleAlert];
                    
                    UIAlertAction
                    *defaultAction
                    =[
                      UIAlertAction
                      actionWithTitle:@"OK"
                      style:UIAlertActionStyleDefault
                      handler:^(UIAlertAction *action){}];
                    
                    [ alert addAction :defaultAction];
                    [self presentViewController :alert animated:YES completion:nil];
                    
                }
                
            }
            
            
        }]resume];
        
        
        
        */
 //  }
        
//}
/*
*/
/*
-(void)setUrl:(NSString *)kamal{
    _callUrl= kamal;

}

-(NSString *)getstatus{
    NSString *kamal;
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:_callUrl] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        if (data.length>0 && error == nil) {
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            NSString *longName=[[myMainJsonObject objectForKey:@"Status"]stringValue];
            kamal=longName;
            
        }
        
        
    }]resume];
    return longName;

}
 */
/*

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    __block BOOL should;
    if ([identifier isEqualToString:@"userprofile"]) {
        
        
        
        
        
        
        NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile&%@&%@" ,                                           username.text,password.text];
        
        NSURLSession *mysession=[NSURLSession sharedSession];
        NSLog(@"123456789");
        
        [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
            
            if (data.length>0 && error == nil) {
                
                NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                _status23=[myMainJsonObject objectForKey:@"Status"];
                NSLog(@"this is the variable value ,%@",self.status23);
                //NSLog(@"this is the variable value: %@",status);
                if ([_status23 isEqualToString:@"Ok"]) {
                    //userdetail *myViewController = (userdetail *) segue.destinationViewController;
                    // myViewController.myGlobalLabel=self.myString;
                    // myViewController.input1=username.text;
                    //myViewController.input2=password.text;
                    [self performSegueWithIdentifier:@"userprofile" sender:self];
                    should = YES;
                    
                    
                }
                else if ([_status23 isEqualToString:@"wrong"])
                {
                    
                    UIAlertController
                    *alert
                    =[
                      UIAlertController
                      alertControllerWithTitle:@" ALERT "
                      message:@"error"
                      preferredStyle :UIAlertControllerStyleAlert];
                    
                    UIAlertAction
                    *defaultAction
                    =[
                      UIAlertAction
                      actionWithTitle:@"OK"
                      style:UIAlertActionStyleDefault
                      handler:^(UIAlertAction *action){}];
                    
                    [ alert addAction :defaultAction];
                    [self presentViewController :alert animated:YES completion:nil];
                    should = NO;
                    
                }
                
            }
            
            
            
            
        }
          ]resume];
        
        
        
        
        
        
        
    }
    return should;
}
*/
- (IBAction)login:(id)sender {
    
    NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile&%@&%@" ,                                           username.text,password.text];
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    NSLog(@"123456789");
    
    [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        
        if (data.length>0 && error == nil) {
            
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            _status23=[myMainJsonObject objectForKey:@"Status"];
            NSLog(@"this is the variable value ,%@",self.status23);
            //NSLog(@"this is the variable value: %@",status);
            if ([_status23 isEqualToString:@"Ok"]) {
                //userdetail *myViewController = (userdetail *) segue.destinationViewController;
                // myViewController.myGlobalLabel=self.myString;
                // myViewController.input1=username.text;
                //myViewController.input2=password.text;
               // [self performSegueWithIdentifier:@"userprofile" sender:self];
               // should = YES;
                
                
            }
            else if ([_status23 isEqualToString:@"wrong"])
            {
                
                UIAlertController
                *alert
                =[
                  UIAlertController
                  alertControllerWithTitle:@" ALERT "
                  message:@"error"
                  preferredStyle :UIAlertControllerStyleAlert];
                
                UIAlertAction
                *defaultAction
                =[
                  UIAlertAction
                  actionWithTitle:@"OK"
                  style:UIAlertActionStyleDefault
                  handler:^(UIAlertAction *action){}];
                
                [ alert addAction :defaultAction];
                [self presentViewController :alert animated:YES completion:nil];
               // should = NO;
                
            }
            
        }
        
        
        
        
    }
      ]resume];

   /* NSLog(@"987654321       kamal       ");
    
    NSString *url23=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/loginuserprofile&%@&%@" ,                                           username.text,password.text];
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    NSLog(@"123456789");
    
    [[mysession dataTaskWithURL:[NSURL URLWithString:url23] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        
        if (data.length>0 && error == nil) {
            
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            _status23=[myMainJsonObject objectForKey:@"Status"];
            NSLog(@"this is the variable value ,%@",self.status23);
            //NSLog(@"this is the variable value: %@",status);
            if ([_status23 isEqualToString:@"Ok"]) {
                //userdetail *myViewController = (userdetail *) segue.destinationViewController;
                // myViewController.myGlobalLabel=self.myString;
               // myViewController.input1=username.text;
                //myViewController.input2=password.text;
                [self performSegueWithIdentifier:@"userprofile" sender:self];
                
            }
            else if ([_status23 isEqualToString:@"wrong"])
            {
                UIAlertController
                *alert
                =[
                  UIAlertController
                  alertControllerWithTitle:@" ALERT "
                  message:@"error"
                  preferredStyle :UIAlertControllerStyleAlert];
                
                UIAlertAction
                *defaultAction
                =[
                  UIAlertAction
                  actionWithTitle:@"OK"
                  style:UIAlertActionStyleDefault
                  handler:^(UIAlertAction *action){}];
                
                [ alert addAction :defaultAction];
                [self presentViewController :alert animated:YES completion:nil];
                
                
            }
        
        }
        
        
        
        
    }
      ]resume];

    */
}
@end
