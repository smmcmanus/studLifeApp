//
//  SearchResults.m
//  studLifeApp
//
//  Created by Sean McManus on 11/29/15.
//  Copyright © 2015 WUSTL. All rights reserved.
//

#import "ArticleViewController.h"
#import "SearchResults.h"

@interface SearchResults ()

@end

@implementation SearchResults

- (void)viewDidLoad {
    [super viewDidLoad];
    searchTitles = [[NSMutableArray alloc] init];
    searchIds = [[NSMutableArray alloc] init];
    [self getTitles];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getTitles {
    NSLog(@"%@", _query);
    NSString *todayJson = [NSString stringWithFormat:@"http://www.studlife.com/api/get_search_results/?search=%@&count=100", _query];
    NSLog(@"%@", todayJson);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:todayJson]];
    __block NSDictionary *json;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               json = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:nil];

                               NSNumber * articleCount = json[@"count"];
                               for(int i = 0; i < articleCount.integerValue; i++){
                                    NSString *title = json[@"posts"][i][@"title"];
                                    NSNumber *idNum = json[@"posts"][i][@"id"];
                                    [searchTitles insertObject:title atIndex: i];
                                    [searchIds insertObject:idNum atIndex:i];
                                
                               }
                               
                               [self.tableView reloadData];
                               
                           }];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [searchTitles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [searchTitles objectAtIndex:indexPath.row];
    cell.tag = [[searchIds objectAtIndex:indexPath.row] integerValue];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
   /* ArticleViewController *avc = [[ArticleViewController alloc]init];
    avc.articleID = [[searchIds objectAtIndex:indexPath.row]integerValue];
    [self.navigationController pushViewController:avc animated:YES]; */
    _index = indexPath.row;
    [self performSegueWithIdentifier:@"goToArticle" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"In prep");
    if ([segue.identifier isEqualToString:@"goToArticle"])
    {
        ArticleViewController *controller = (ArticleViewController*)segue.destinationViewController;
        controller.articleID = [[searchIds objectAtIndex:_index]integerValue];
    }
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
