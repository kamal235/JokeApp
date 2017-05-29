//
//  jokesByCategory.m
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "jokesByCategory.h"
#import "jokeDetail.h"

@interface jokesByCategory ()

@end

@implementation jokesByCategory

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/jokesbycategory&%@" , _url2];
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        if (data.length>0 && error == nil) {
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSArray *list=[myMainJsonObject objectForKey:@"jokesbyCategory"];
            
            NSMutableArray *kamal=[NSMutableArray arrayWithCapacity:[list count]];
            NSMutableArray *kamal23=[NSMutableArray arrayWithCapacity:[list count]];
            for (NSDictionary *mysingleresult in list) {
                NSString *kool1=[mysingleresult objectForKey:@"JokeId"];
                
                [kamal addObject:kool1];
                
                
                [kamal23 addObject:[mysingleresult objectForKey:@"JokeTitle"]];
                
                
            }
            self.myTitleArray=[kamal copy];
            self.mySubTitleArray=[kamal23 copy];
            
        }
    }]resume];

    // Do any additional setup after loading the view.
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
    self.myString=[self.myTitleArray  objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"catTojokeDetail" sender:self];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"catTojokeDetail"])
        
    {
        // NSLog(@"this is the variable value , WRONG%@",self.myString);
        
        jokeDetail *myViewController = (jokeDetail *) segue.destinationViewController;
        
        myViewController.myString2345=self.myString;
        
        
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
