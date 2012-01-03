//
//  DetaialViewController.h
//  Channel
//
//  Created by Aneesh on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewSocialDetailsController.h"
#import "CustomAlertviewController.h"
@protocol detailViewControllerDelegate
-(IBAction) doFlip :(id)sender ;//doFlip;
-(void) doAnimation;
@end
@interface DetaialViewController : UIViewController{
IBOutlet UIScrollView *scroll;
id <detailViewControllerDelegate> delegate;
IBOutlet UIButton *thumbUpbtn;
IBOutlet UIButton *thumbDownbtn;
IBOutlet UIImageView *mainImageView;
IBOutlet UIButton *closebtn;
IBOutlet UIButton *viewSocialbtn;
UIWebView * WebView;
IBOutlet UIImageView *backgroungImg; 
CustomAlertviewController *customAlertviewController;    
}
-(IBAction) closeButton;
-(IBAction) thumbTap:(UIButton *) thumb;
-(IBAction) imdbTap;
-(IBAction) wikiTap;
-(IBAction) viewSocialTap;
-(void) tapClose;
-(IBAction) viewSocialAnimation:(id)sender;
@property(nonatomic,strong) id <detailViewControllerDelegate> delegate;
@property(nonatomic,strong) IBOutlet UIImageView *backgroungImg; 
@property(nonatomic,strong) CustomAlertviewController *customAlertviewController;
@end

