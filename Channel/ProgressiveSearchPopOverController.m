//
//  ProgressiveSearchPopOverController.m
//  Channel
//
//  Created by Aneesh on 03/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgressiveSearchPopOverController.h"

@implementation ProgressiveSearchPopOverController
@synthesize delegate;
@synthesize name,searchWasActive,filteredListContent;
//@synthesize filteredListContent, savedSearchTerm, savedScopeButtonIndex, searchWasActive,textSearch;

//@synthesize array;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
        
    
     name=[[NSMutableArray alloc]init]; 
     [name addObject: @"raju"];
     [name addObject: @"glee"];
     [name addObject: @"ashu"];
     [name addObject: @"ashu"];
     [name addObject: @"Prakash"];
     [name addObject: @"aakash"];
     [name addObject: @"Suresh"];
    [name addObject: @"Tina"];
   
    NSLog(@"lllllll--------%d",searchWasActive);
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
- (void)viewDidDisappear:(BOOL)animated
{    [super viewDidDisappear:animated];
    // save the state of the search UI so that it can be restored if the view is re-created
//    self.searchWasActive = [self.searchDisplayController isActive];
//    self.savedSearchTerm = [self.searchDisplayController.searchBar text];
//    self.savedScopeButtonIndex = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    if (searchWasActive==2){
          if([filteredListContent count]==0){
               NSLog(@"no result");
              noresultfound=1;
            return 1;
          }
          else{
           return [filteredListContent count];
          }
     }
    
   else {
    return 7;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[name objectAtIndex:indexPath.row];
    
    
    if(searchWasActive==2) {
        
         if(noresultfound==1){
             NSLog(@"no result");
            cell.textLabel.text=@"NO RESULT FOUND";
         }
         else{
         cell.textLabel.text=[filteredListContent objectAtIndex:indexPath.row];
         NSLog(@"filtered list content is %d",[filteredListContent count]);
         }      
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    /*if (indexPath.row==1) {
        [delegate dothis];
    }
     */
    
    [delegate removeKeyBoard];
    [delegate removePopover];
    if ([[filteredListContent objectAtIndex:indexPath.row] isEqualToString:@"glee"]) {
     [delegate dothis];
    }
   
  //  [delegate removePopover];
    //[self.parentViewController dothis];
}

@end
