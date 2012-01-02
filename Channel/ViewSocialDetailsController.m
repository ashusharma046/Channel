//
//  ViewSocialDetailsController.m
//  Channel
//
//  Created by Aneesh on 31/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewSocialDetailsController.h"

@implementation ViewSocialDetailsController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       NSLog(@"%@-----------",nibNameOrNil);
    }
    return self;
}
-(IBAction)viewmoreInfo
{   /*
    [UIView transitionWithView:[self.view superview] duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{[self.view removeFromSuperview];} completion:^(BOOL f){}];
   */ 
     NSLog(@"reverse-------");
}
-(IBAction)reverseFlipAnimation{
    NSLog(@"reverse-------");
    [UIView transitionWithView:[self.view superview] duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.view removeFromSuperview];
    } completion:^(BOOL f){}];
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
