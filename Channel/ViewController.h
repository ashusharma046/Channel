//
//  ViewController.h
//  Channel
//
//  Created by Aneesh on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetaialViewController.h"
#import "FavouriteImagesPopOver.h"
#import "ViewSocialDetailsController.h"
#import "ProgressiveSearchPopOverController.h"
@interface ViewController : UIViewController<detailViewControllerDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate,favouriteImagePopOverdelegate,UITextFieldDelegate,ProgressiveSearchPopOverControllerdelegate>{
    IBOutlet UIImageView *favouriteImg; 
    UIPopoverController * favouriteImagePopOverController;
    UIPopoverController * progressiveSearchPopOverController;
    UIImageView * bottomImageView;
    UIImageView *flipImg;
    DetaialViewController *detaialViewController;
    ViewSocialDetailsController *viewSocialDetailsController;
    ProgressiveSearchPopOverController *popOver;
    UIImageView *toby1;
    UIButton *watchnowbtn;
    UIButton *moreinfbtn;
    UIScrollView *topScroll;
    UIView *baseView;
    IBOutlet UIButton *topScrollBtn; 
    IBOutlet UIScrollView *childTopScroll;
    IBOutlet UIView *topView;
    UINavigationController *baseContoller;
    IBOutlet UILabel *favlabel;
    
   
    
    UIScrollView *scroll;
    float initialScroll;
    UIScrollView *sc3;
    UIScrollView *sc2;
    
    UIScrollView *sc1;
    
    IBOutlet UIButton *tobychannel;
    IBOutlet UIButton *ginaChannel;
    
    UIImage *tobygina1,*tobygina2,*tobygina3;
    IBOutlet UITextField *searchTetField;
    
    IBOutlet UIButton *closeButton;
    
}
@property(nonatomic,strong) IBOutlet UIImageView *favouriteImg;
@property(nonatomic,strong) UIPopoverController *favouriteImagePopOverController;
@property(nonatomic,strong) UINavigationController *navcontroller;
@property(nonatomic,strong) IBOutlet UIScrollView *scView;

@property(nonatomic,strong) IBOutlet UIImageView *immg;
@property(nonatomic,strong) IBOutlet  UIImageView *bottomImageView;
@property(nonatomic,strong) DetaialViewController *detaialViewController;
@property(nonatomic,strong) IBOutlet UIButton *topScrollBtn;
@property(nonatomic,strong) IBOutlet UIScrollView *childTopScroll;
@property(nonatomic,strong) IBOutlet UIView *topView;
@property(nonatomic,strong) IBOutlet UILabel *favlabel;
@property(nonatomic,strong) ViewSocialDetailsController *viewSocialDetailsController;
@property(nonatomic,strong) UIPopoverController * progressiveSearchPopOverController;
@property(nonatomic,strong) IBOutlet UIButton *tobychannel;
@property(nonatomic,strong) IBOutlet UIButton *ginaChannel;
@property(nonatomic,strong) IBOutlet UITextField *searchTetField;

@property(nonatomic,strong) IBOutlet UIButton *closeButton;


-(IBAction)handlFavouriteTap :(UITapGestureRecognizer *)recognizer;
-(void) addBottemButtons;
-(IBAction)startingActivityAnimation : (id) sender;
-(void) displayBottomButtons3;
-(IBAction)bottomButtonPressed2:(id)sender;
-(IBAction)displayChanell:(UIButton *)sender;
-(void)secAnimation;
- (NSMutableArray *)filterContentForSearchText:(NSString*)searchText;
-(IBAction) clearTextField;
@end
