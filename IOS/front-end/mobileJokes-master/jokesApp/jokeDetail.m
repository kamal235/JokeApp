//
//  jokeDetail.m
//  jokesApp
//
//  Created by Kamalpreet singh on 2017-02-26.
//  Copyright © 2017 Kamalpreet singh. All rights reserved.
//

#import "jokeDetail.h"

@interface jokeDetail ()

@end

@implementation jokeDetail
{

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 750)];
    
    
    NSString *url2=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/jokedetails&%@",_myString2345];
    NSURLSession *mysession1=[NSURLSession sharedSession];
    [[mysession1 dataTaskWithURL:[NSURL URLWithString:url2] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        if (data.length>0 && error == nil) {
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSString *jokedetail1=[myMainJsonObject objectForKey:@"JokeTitle"];
            NSString *postedby1=[myMainJsonObject objectForKey:@"postedBy"];
            NSString *joke1=[myMainJsonObject objectForKey:@"Joke"];
            jjoke.text=joke1;
            jdetail.text=jokedetail1;
            jposted.text=postedby1;
            
        
            
        }
    }]resume];
    
   // NSString *url=@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/jokeratingandcomment";
    NSString *url=[NSString stringWithFormat:@"http://144.217.163.57:8080/cegepgim/mobile/jokeapp/jokeratingandcomment&%@" , _myString2345];
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * data ,NSURLResponse * response ,NSError * error){
        if (data.length>0 && error == nil) {
            NSDictionary *myMainJsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSArray *list=[myMainJsonObject objectForKey:@"comments&ratings"];
            
            NSMutableArray *kamal=[NSMutableArray arrayWithCapacity:[list count]];
            NSMutableArray *kamal23=[NSMutableArray arrayWithCapacity:[list count]];
            NSMutableArray *kamal231=[NSMutableArray arrayWithCapacity:[list count]];
            for (NSDictionary *mysingleresult in list) {
                NSString *kool1=[mysingleresult objectForKey:@"postedBy"];
                
                [kamal addObject:kool1];
                
                
                [kamal23 addObject:[mysingleresult objectForKey:@"comment_on_joke"]];
                [kamal231 addObject:[[mysingleresult objectForKey:@"ratingGiven"]stringValue] ];
                
                
            }
            self.myTitleArray=[kamal copy];
            self.mySubTitleArray=[kamal23 copy];
            self.mySubTitleArray23=[kamal231 copy];
            
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
    
    CustomCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath ] ;
    
    cell.name.text=[self.myTitleArray objectAtIndex: indexPath.row];
    cell.rating.text=[self.mySubTitleArray  objectAtIndex:indexPath.row];
    cell.comment.text=[self.mySubTitleArray23  objectAtIndex:indexPath.row];
    return cell;
    
}

-(void ) tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    self.myString=[self.mySubTitleArray  objectAtIndex:indexPath.row];
    
    
   // [self performSegueWithIdentifier:@"jokebycat" sender:self];
    
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
