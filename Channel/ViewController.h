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
@interface ViewController : UIViewController<detailViewControllerDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate,favouriteImagePopOverdelegate>{
    IBOutlet UIImageView *favouriteImg; 
    UIPopoverController * favouriteImagePopOverController;
    UIImageView * bottomImageView;
    UIImageView *flipImg;
    DetaialViewController *detaialViewController;
    UIScrollView *sc2;
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
    
    
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    
    
    UIScrollView *scroll;
    float initialScroll;
    
    
    UIScrollView *sc1;
    
    IBOutlet UIButton *tobychannel;
    IBOutlet UIButton *ginaChannel;
    
    UIImage *tobygina1,*tobygina2,*tobygina3;

    
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

@property(nonatomic,strong) IBOutlet UILabel *label1;
@property(nonatomic,strong) IBOutlet UILabel *label2;
@property(nonatomic,strong) IBOutlet UILabel *label3;

@property(nonatomic,strong) IBOutlet UIButton *tobychannel;
@property(nonatomic,strong) IBOutlet UIButton *ginaChannel;



-(IBAction)handlFavouriteTap :(UITapGestureRecognizer *)recognizer;
-(void) addBottemButtons;
-(IBAction)startingActivityAnimation : (id) sender;
-(void) displayBottomButtons3;
-(IBAction)bottomButtonPressed2:(id)sender;
-(IBAction)displayChanell:(UIButton *)sender;
-(void)secAnimation;


@end
