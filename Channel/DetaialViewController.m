//
//  DetaialViewController.m
//  Channel
//
//  Created by Aneesh on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetaialViewController.h"
#import "ViewSocialDetailsController.h"


@implementation DetaialViewController
@synthesize delegate;
@synthesize backgroungImg;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%@-----------",nibNameOrNil);
    }
    return self;
}
-(IBAction) viewSocialAnimation:(id)sender{
 
    ViewSocialDetailsController *viewSocialDetailsController = [[ViewSocialDetailsController alloc] initWithNibName:@"ViewSocialDetailsController" bundle:Nil];
    viewSocialDetailsController.delegate=self;
       [self.view addSubview:viewSocialDetailsController.view];
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL f){}];
    
    
  
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(IBAction) closeButton{
    NSLog(@"close");
    [delegate doFlip:self];
}
-(IBAction) thumbTap:(UIButton *) thumb{
}
-(IBAction) imdbTap{
}
-(IBAction) wikiTap{
}
-(IBAction) viewSocialTap{
    [delegate domoreInfo];
}
-(void) tapClose{
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UIImage *scImage= [UIImage imageNamed:@"glee-details.png"];
    UIImageView *scImageView = [[UIImageView alloc] initWithImage:scImage];
  
    scroll.contentSize = CGSizeMake(scImage.size.width, scImage.size.height);
    [scroll addSubview:scImageView ];
    self.view.backgroundColor=[UIColor clearColor];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
