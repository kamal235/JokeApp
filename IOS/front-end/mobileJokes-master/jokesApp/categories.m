//
//  categories.m
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "categories.h"
#import "jokesByCategory.h"
#import "SWRevealViewController.h"
@interface categories ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation categories

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.myMenu setTarget: self.revealViewController];
        [self.myMenu setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    // Do any additional setup after loading the view.
   NSString *url=@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/categories";
    
    
    
  
    
    
    
    
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        if (data.length>0 && error == nil) {
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSArray *list=[myMainJsonObject objectForKey:@"categoryList"];
            
            NSMutableArray *kamal=[NSMutableArray arrayWithCapacity:[list count]];
            NSMutableArray *kamal23=[NSMutableArray arrayWithCapacity:[list count]];
            for (NSDictionary *mysingleresult in list) {
                NSString *kool1=[mysingleresult objectForKey:@"name"];
                
                [kamal addObject:kool1];
                
                
                [kamal23 addObject:[mysingleresult objectForKey:@"categoryId"]];
                
                
            }
            self.myTitleArray=[kamal copy];
            self.mySubTitleArray=[kamal23 copy];
            
        }
        [self.activityIndicator stopAnimating];
         self.activityIndicator.hidden=YES;
    }]resume];
    
    
}




-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    int i=[self.myTitleArray count];
    while (i== 0) {
        i=[self.myTitleArray count] ;
        
    }
    return [self.myTitleArray count];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath ];
    
    cell.textLabel.text=[self.myTitleArray objectAtIndex: indexPath.row];
    cell.detailTextLabel.text=[self.mySubTitleArray  objectAtIndex:indexPath.row];
    return cell;
    
}

-(void ) tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    self.myString=[self.mySubTitleArray  objectAtIndex:indexPath.row];
  
    
    [self performSegueWithIdentifier:@"jokebycat" sender:self];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"jokebycat"])
        
    {
       // [self.activityIndicator stopAnimating];
      //  self.activityIndicator.hidden=YES;
       // NSLog(@"this is the variable value , WRONG%@",self.myString);
        
        jokesByCategory *myViewController = (jokesByCategory *) segue.destinationViewController;
        
        myViewController.url2=self.myString;
        
        
    }
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
