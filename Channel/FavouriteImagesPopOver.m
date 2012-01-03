//
//  FavouriteImagesPopOver.m
//  Channel
//
//  Created by Aneesh on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FavouriteImagesPopOver.h"
#import "AppDelegate.h"

@implementation FavouriteImagesPopOver
@synthesize delegate;
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
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.title= appDelegate.popovertitle;
   
 
    
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

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 4;
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // Returns section title based on physical state: [solid, liquid, gas, artificial]
    return @"Sharma";
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section==3){
        return 7;
    }
    else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
   
    NSMutableArray *array  =[[NSMutableArray alloc] initWithObjects:@"Favourites",@"Action/Adventure",@"Comedy",@"Drama",@"Indie/Foreign",@"News",@"Reality TV",nil];
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.row==0 && indexPath.section==0){
        cell.textLabel.text=@"Favourites";
    } 
    if(indexPath.row==0 && indexPath.section==1){
        cell.textLabel.text=@"Popular";
    } 
    if(indexPath.row==0 && indexPath.section==2){
        cell.textLabel.text=@"Movies";
    } 
    if(indexPath.section > 2){
        cell.textLabel.text= [array objectAtIndex:indexPath.row];
    }
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if(indexPath.section == appDelegate.pathSection && indexPath.row == appDelegate.pathRow){
          NSLog(@"index path row --%dand section are----%d",appDelegate.pathSection,appDelegate.pathRow);
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else{
        [cell setAccessoryType:nil];
    }
    
  
    //[cell setEditingAccessoryType:UITableViewCellAccessoryCheckmark];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   NSString *title;
    NSMutableArray *array  =[[NSMutableArray alloc] initWithObjects:@"Favourites",@"Action/Adventure",@"Comedy",@"Drama",@"Indie/Foreign",@"News",@"Reality TV",nil];
  

    if(indexPath.row==0 && indexPath.section==0){
       title=@"Favourites";
    } 
    if(indexPath.row==0 && indexPath.section==1){
         title=@"Popular";
    } 
    if(indexPath.row==0 && indexPath.section==2){
         title=@"Movies";
    } 
    if(indexPath.section > 2){
        title= [array objectAtIndex:indexPath.row];
    }

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.popovertitle=[NSMutableString stringWithString:title];
    appDelegate.pathRow=indexPath.row;
    appDelegate.pathSection=indexPath.section;
    
    self.title=appDelegate.popovertitle;
    [self.tableView reloadData];
    [delegate setTitle];
}

@end
