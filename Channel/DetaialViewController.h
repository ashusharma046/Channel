//
//  DetaialViewController.h
//  Channel
//
//  Created by Aneesh on 24/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewSocialDetailsController.h"
@protocol detailViewControllerDelegate
-(IBAction) doFlip :(id)sender ;//doFlip;
-(void) domoreInfo;
@end
@interface DetaialViewController : UIViewController<ViewSocialDetailsControllerDelegate>{
IBOutlet UIScrollView *scroll;
id <detailViewControllerDelegate> delegate;
IBOutlet UIButton *thumbUpbtn;
IBOutlet UIButton *thumbDownbtn;
IBOutlet UIImageView *mainImageView;
IBOutlet UIButton *closebtn;
IBOutlet UIButton *viewSocialbtn;
UIWebView * WebView;
IBOutlet UIImageView *backgroungImg;    
}
-(IBAction) closeButton;
-(IBAction) thumbTap:(UIButton *) thumb;
-(IBAction) imdbTap;
-(IBAction) wikiTap;
-(IBAction) viewSocialTap;
-(void) tapClose;
-(IBAction) viewSocialAnimation:(id)sender;
@property(nonatomic,strong) id <detailViewControllerDelegate> delegate;
@property(nonatomic,strong) IBOutlet UIImageView *backgroungImg; ;
@end

