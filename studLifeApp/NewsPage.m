//
//  NewsPage.m
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import "NewsPage.h"
#import "ArticleViewController.h"
#import "TableViewCellWithImage.h"
#import "TableViewCellWithText.h"
#import "SearchPage.h"
@interface NewsPage ()

@end

@implementation NewsPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"News";
    newsTitles = [[NSMutableArray alloc] init];
    newsIds = [[NSMutableArray alloc] init];
    newsAuthors = [[NSMutableArray alloc]init];
    newsDates = [[NSMutableArray alloc]init];
    newsExcerpts = [[NSMutableArray alloc]init];
    newsCategories = [[NSMutableArray alloc]init];
    self.title = @"News";
    [self.navigationItem setTitle:@"Student Life"];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = button;
    /* _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
     // _spinner.center = self.view.center;
     [_spinner setCenter:CGPointMake(50, 50)];
     [self.view addSubview:_spinner];*/
    // [_spinner startAnimating];
    
    [self getTitles];
    self.tableView.separatorColor = [UIColor blackColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)search{
    SearchPage *search = [[SearchPage alloc] init];
    [self.navigationController pushViewController:search animated:YES];
}
-(void) getTitles {
    NSString *todayJson = @"http://www.studlife.com/api/get_recent_posts/?count=100";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:todayJson]];
    __block NSDictionary *json;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               json = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:nil];
                                int count = 0;
                               for(int i = 0; i < 100; i++){
                                   NSString *url = json[@"posts"][i][@"url"];
                                   if([url containsString:@"news"]){
                                    NSString *category = json[@"posts"][i][@"categories"][0][@"title"];
                                    NSString *title = json[@"posts"][i][@"title"];
                                    NSNumber *idNum = json[@"posts"][i][@"id"];
                                    NSString *author = json[@"posts"][i][@"author"][@"name"];
                                    NSString *date = json[@"posts"][i][@"date"];
                                    NSString *excerpt = json[@"posts"][i][@"excerpt"];
                                   
                                   
                                    [newsCategories insertObject:category atIndex:count];
                                    [newsTitles insertObject:title atIndex: count];
                                    [newsIds insertObject:idNum atIndex:count];
                                    [newsAuthors insertObject:author atIndex:count];
                                    [newsDates insertObject:date atIndex:count];
                                    [newsExcerpts insertObject:excerpt atIndex:count];
                                    count++;
                                }
                               }
                               //[_spinner stopAnimating];
                               [self.tableView reloadData];
                               
                           }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [newsTitles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier1 = @"TableViewCellWithText";
    //static NSString *CellIdentifier2 = @"TableViewCellWithText";
    TableViewCellWithText *cellWithText = (TableViewCellWithText*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cellWithText == nil){
        cellWithText = [[TableViewCellWithText alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
    }
    
    cellWithText.category.text = [[newsCategories objectAtIndex:indexPath.row] uppercaseString];
    cellWithText.title.text = [newsTitles objectAtIndex:indexPath.row];
    cellWithText.author.text = [newsAuthors objectAtIndex:indexPath.row];
    
    NSString *dateSubstring = [[newsDates objectAtIndex:indexPath.row] substringToIndex:10];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *dfs = [df dateFromString:dateSubstring];
    [df setDateFormat:@"MMMM dd, yyyy"];
    
    cellWithText.date.text = [df stringFromDate:dfs];
    NSString *excerpts = [self stringByStrippingHTML:[newsExcerpts objectAtIndex:indexPath.row]];
    cellWithText.text.text = excerpts;
    cellWithText.tag = [[newsIds objectAtIndex:indexPath.row] integerValue];
    
    return cellWithText;
    
    /*static NSString *cellIdentifier = @"Cell";
     
     UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     if(cell == nil){
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
     }
     
     cell.textLabel.text = [homeTitles objectAtIndex:indexPath.row];
     cell.tag = [[homeIds objectAtIndex:indexPath.row] integerValue];
     cell.textLabel.font = [UIFont systemFontOfSize:12.0];
     
     return cell;*/
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
    //    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    //
    //    // Pass the selected object to the new view controller.
    //
    //    // Push the view controller.
    //    [self.navigationController pushViewController:detailViewController animated:YES];
    
    /*ArticleViewController *avc = [[ArticleViewController alloc]init];
     avc.articleID = [[homeIds objectAtIndex:indexPath.row]integerValue];
     [self.navigationController pushViewController:avc animated:YES];
     
     NSLog(@"%@", [homeIds objectAtIndex:indexPath.row]);*/
    _index = indexPath.row;
    NSLog(@"Call perform");
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"In prep");
    if ([segue.identifier isEqualToString:@"showDetail"])
    {
        ArticleViewController *controller = (ArticleViewController*)segue.destinationViewController;
        controller.articleID = [[newsIds objectAtIndex:_index]integerValue];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

-(NSString *) stringByStrippingHTML: (NSString*)text {
    NSRange r;
    while ((r = [text rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        text = [text stringByReplacingCharactersInRange:r withString:@""];
    return text;
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
