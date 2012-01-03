//
//  ViewController.m
//  Channel
//
//  Created by Aneesh on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "FavouriteImagesPopOver.h"
#import <QuartzCore/QuartzCore.h>
#import "DetaialViewController.h"
#import "AppDelegate.h"
@implementation ViewController
@synthesize favouriteImg;
@synthesize favouriteImagePopOverController,navcontroller,scView,immg,bottomImageView,detaialViewController,topScrollBtn,childTopScroll,topView,favlabel;
//@synthesize label1,label2,label3;
@synthesize tobychannel;
@synthesize ginaChannel;
@synthesize viewSocialDetailsController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlFavouriteTap:)];
  
    tap.numberOfTapsRequired=1;
    favouriteImg.tag=5;
    [favouriteImg addGestureRecognizer:tap];
    [scView setContentSize:CGSizeMake(3*1024, 200)];
     [childTopScroll setContentSize:CGSizeMake(311, 49)];
    
    UIImage * ginaChannelImg =[UIImage imageNamed:@"GINA_channels.png"];
    UIImage * ginaImg =[UIImage imageNamed:@"Gina-1.png"];
    UIImage * bothImg = [UIImage imageNamed:@"Toby&Gina-2.png"];
   
    
    tobygina1 = [UIImage imageNamed:@"TOBY&GINA_channels.png"];
    tobygina2 = [UIImage imageNamed:@"Toby&Gina-1.png"];
    tobygina3 = [UIImage imageNamed:@"Toby&Gina-2.png"];

    UISwipeGestureRecognizer *swipe =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handletopScrollSwipe:)] ;
    swipe.delegate=self;
    swipe.direction=UISwipeGestureRecognizerDirectionLeft;
    
    
    UIImageView *ginaChanell=[[UIImageView alloc] initWithImage:ginaChannelImg];
    toby1=[[UIImageView alloc] initWithImage:ginaImg];
    UIImageView *both=[[UIImageView alloc] initWithImage:bothImg];
    
    sc1=[[UIScrollView alloc] init];
    sc1.frame=CGRectMake(0, 0, ginaChannelImg.size.width, 430);
    [sc1 addGestureRecognizer:swipe];
    
    
    sc2=[[UIScrollView alloc] init];
    sc2.frame=CGRectMake(ginaChannelImg.size.width, 0,ginaImg.size.width, 430);
    sc2.delaysContentTouches=NO;
    
    sc3=[[UIScrollView alloc] init];
    sc3.frame=CGRectMake(ginaImg.size.width+ginaChannelImg.size.width, 0, bothImg.size.width,430);
        
    [sc1 setContentSize:CGSizeMake(1024, 1500)];
    [sc2 setContentSize:CGSizeMake(1024, 1500)];
    [sc3 setContentSize:CGSizeMake(1024, 1500)];
    [scView setContentSize:CGSizeMake(3*1024, 499)];
    
    [scView addSubview:sc1];
    [scView addSubview:sc2];
    [scView addSubview:sc3];
   
    [immg setBackgroundColor:[UIColor clearColor]];
    
  
    
    
    [sc1 addSubview:ginaChanell];
    [sc2 addSubview:toby1];
    [sc3 addSubview:both];
    [sc1 setContentSize:CGSizeMake(ginaChannelImg.size.width, ginaChannelImg.size.height)];
    [sc2 setContentSize:CGSizeMake(ginaImg.size.width, ginaImg.size.height)];
    [sc3 setContentSize:CGSizeMake(bothImg.size.width,bothImg.size.height)];
    

    flipImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"glee_thumb.png"]];
    flipImg.frame=CGRectMake(520, 28, flipImg.frame.size.width,  flipImg.frame.size.height);
    
    UITapGestureRecognizer *fliptap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fliptap:)] ;
   
    [toby1 addSubview:flipImg];
    flipImg.userInteractionEnabled=YES;
    toby1.userInteractionEnabled=YES;
     [flipImg addGestureRecognizer:fliptap];
    
    
    UITapGestureRecognizer *tapGesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlFavouriteTap:)] ;
   
    
  
    UILabel *lab1=[[UILabel alloc] init];
     lab1.frame=CGRectMake(0, 0, 341.33, 35);
    lab1.text=@"Favourite Channel";
  
    lab1.backgroundColor=[UIColor clearColor];
    lab1.tag=1;
    lab1.userInteractionEnabled=YES;
 
    lab1.textAlignment = UITextAlignmentCenter;
    [lab1 addGestureRecognizer:tapGesture];
    [lab1 addGestureRecognizer:swipe];
    
    UILabel *lab2=[[UILabel alloc] init];
    lab2.frame=CGRectMake(341.33, 0, 341.33, 35);
    lab2.text=@"Watch now";
    lab2.backgroundColor=[UIColor clearColor];
    lab2.tag=2;
    lab2.userInteractionEnabled=YES;
    lab2.textAlignment = UITextAlignmentCenter;
    
    
    UITapGestureRecognizer *tapGesture2 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlFavouriteTap:)] ;
    [lab2 addGestureRecognizer:tapGesture2];
    
    UILabel *lab3=[[UILabel alloc] init];
    lab3.frame=CGRectMake(682, 0, 341.33, 35);
    lab3.text=@"Watch later";
    lab3.backgroundColor=[UIColor clearColor];
    lab3.tag=3;
    lab3.userInteractionEnabled=YES;
    lab3.textAlignment = UITextAlignmentCenter;
    
    UITapGestureRecognizer *tapGesture3 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlFavouriteTap:)] ;
    [lab3 addGestureRecognizer:tapGesture3];
        
    topScroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0,0,1024,50)]; 
   
    [topView addSubview:topScroll];
  
    
    topScroll.delegate=self;
     
    [topScroll addSubview:lab1];
    [topScroll addSubview:lab2];
    [topScroll addSubview:lab3];
    
    [scroll setContentSize:CGSizeMake(261,42)];
    [topScroll setContentSize:CGSizeMake(1200,42)];
    [topScroll setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar//.png"]]];
    
    
    UIImage * bottomImage = [UIImage imageNamed:@"bottom_bar.png"];
    bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 658, bottomImage.size.width, 90)];
    bottomImageView.image = bottomImage;
    bottomImageView.userInteractionEnabled = YES;
    [self.view addSubview:bottomImageView];
    [self addBottemButtons];
   
    
    
    detaialViewController=[[DetaialViewController alloc] init];
    detaialViewController.delegate=self;
   
    [scView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    [topScrollBtn setBackgroundColor:[UIColor clearColor]];
    
    
    
    scView.delegate=self;
    sc1.userInteractionEnabled=YES;
    ginaChanell.userInteractionEnabled=YES;
    toby1.userInteractionEnabled=YES;
    both.userInteractionEnabled=YES;
    CGPoint offset=[scView contentOffset];
    offset.x=50;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
       
    CGPoint offset1 = [topScroll contentOffset];
    offset1.x=-340;
    [topScroll setContentOffset:offset1];
   
    scView.pagingEnabled=YES;
    topScroll.pagingEnabled=YES;
   
}


-(IBAction) handletopScrollSwipe:(UISwipeGestureRecognizer *)sender{
    NSLog(@"yeeeeeeeee");
    if(sender.view.tag==1){
        NSLog(@"heeeeeeeee");
    }
    
}



-(IBAction)displayChanell:(UIButton *)sender{
      
    if(sender.selected==YES){
        sender.selected=NO;
        sender.alpha=.6;
        NSLog(@"se");
    }
    else{
        sender.selected=YES;
        sender.alpha=1;
         NSLog(@"ge");
    }
    
    
    UIImage * tobyImg = [UIImage imageNamed:@"Toby_channels.png"];
    UIImage * tobyImg1 = [UIImage imageNamed:@"Toby-1.png"];
    UIImage * tobyImg2 = [UIImage imageNamed:@"Toby-2.png"];
    UIImage * ginaChannelImg =[UIImage imageNamed:@"GINA_channels.png"];
    UIImage * ginaChannelImg1 =[UIImage imageNamed:@"Gina-1.png"];
    UIImage * ginaChannelImg2 =[UIImage imageNamed:@"Gina-2.png"];
    UIImage * bothImg = [UIImage imageNamed:@"TOBY&GINA_channels.png"];
    UIImage * bothImg1 = [UIImage imageNamed:@"Toby&Gina-1.png"];
    UIImage * bothImg2 = [UIImage imageNamed:@"Toby&Gina-2.png"];
    if( tobychannel.selected==YES ){
         NSLog(@"111111111");
        
        UIImageView *tobyImageview =[[UIImageView alloc] initWithImage:tobyImg];
        tobyImageview.frame=CGRectMake(0, 0, tobyImg.size.width, tobyImg.size.height);
        for( UIView *view in [sc1 subviews]){
            [view removeFromSuperview];
        }
        
        [sc1 addSubview:tobyImageview];
        
        
        UIImageView *tobyImageview1 =[[UIImageView alloc] initWithImage:tobyImg1];
        tobyImageview1.frame=CGRectMake(0, 0, tobyImg1.size.width, tobyImg1.size.height);
        for( UIView *view in [sc2 subviews]){
            [view removeFromSuperview];
        }
        
        [sc2 addSubview:tobyImageview1];
        [self.view reloadInputViews];
        
        
        UIImageView *tobyImageview2 =[[UIImageView alloc] initWithImage:tobyImg2];
        tobyImageview2.frame=CGRectMake(0, 0, tobyImg2.size.width, tobyImg2.size.height);
        for( UIView *view in [sc3 subviews]){
            [view removeFromSuperview];
        }
        
        [sc3 addSubview:tobyImageview2];
        [self.view reloadInputViews];
        tobyImageview=nil;
        tobyImageview1=nil;
        tobyImageview2=nil;
        
    }
    
    if(ginaChannel.selected==YES ){
        
        NSLog(@"222222222");
        UIImageView *ginaImageview =[[UIImageView alloc] initWithImage:ginaChannelImg];
        ginaImageview.frame=CGRectMake(0, 0, ginaChannelImg.size.width, ginaChannelImg.size.height);
        
        for( UIView *view in [sc1 subviews]){
            [view removeFromSuperview];
        }
        [sc1 addSubview:ginaImageview];
        
        UIImageView *ginaImageview2 =[[UIImageView alloc] initWithImage:ginaChannelImg1];
        ginaImageview2.frame=CGRectMake(0, 0, ginaChannelImg1.size.width, ginaChannelImg1.size.height);
        
        for( UIView *view in [sc2 subviews]){
            [view removeFromSuperview];
        }
        [sc2 addSubview:ginaImageview2];
        
        UIImageView *ginaImageview3 =[[UIImageView alloc] initWithImage:ginaChannelImg2];
        ginaImageview3.frame=CGRectMake(0, 0, ginaChannelImg2.size.width, ginaChannelImg2.size.height);
        
        for( UIView *view in [sc3 subviews]){
            [view removeFromSuperview];
        }
        [sc3 addSubview:ginaImageview3];
       
        
    }
    if( tobychannel.selected==YES && ginaChannel.selected==YES ){
       
         NSLog(@"333333333");
        UIImageView *bothImgview =[[UIImageView alloc] initWithImage:bothImg];
        bothImgview.frame=CGRectMake(0, 0, bothImg.size.width, bothImg.size.height);
        
        for( UIView *view in [sc1 subviews]){
            [view removeFromSuperview];
        }
        [sc1 addSubview:bothImgview];
        
        
        UIImageView *bothImgview2 =[[UIImageView alloc] initWithImage:bothImg1];
        bothImgview2.frame=CGRectMake(0, 0, bothImg2.size.width, bothImg2.size.height);
        
        for( UIView *view in [sc2 subviews]){
            [view removeFromSuperview];
        }
        [sc2 addSubview:bothImgview2];
        
        
        UIImageView *bothImgview3 =[[UIImageView alloc] initWithImage:bothImg2];
        bothImgview3.frame=CGRectMake(0, 0, bothImg2.size.width, bothImg2.size.height);
        
        for( UIView *view in [sc1 subviews]){
            [view removeFromSuperview];
        }
        [sc2 addSubview:bothImgview3];
    
    }
    
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)sender {
 }


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
  
   }

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{  
    
    CGPoint offset = [scView contentOffset];
    if(scrollView==scView){
            CGPoint offset1 = [topScroll contentOffset];
        if (offset.x<1022){
            offset1.x=-300;
            NSLog(@"11");
            [topScroll setContentOffset:offset1];
        }
        else if (offset.x>=1022 && offset.x<2044) {
            
            NSLog(@"22");
            offset1.x=0;
            [topScroll setContentOffset:offset1];
            
        }
        else if(offset.x>=2044){
            NSLog(@"33");
            offset1.x=380;
            [topScroll setContentOffset:offset1];
        }
        
    }
    
    CGPoint offset1 = [topScroll contentOffset];
    NSLog(@"offset.x is %f  and %f",offset1.x,offset.x);
    
    
   
  }

-(void)secAnimation{
    NSLog(@"sec animation called");
    baseView.hidden=NO;
    [UIView transitionWithView:baseView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{}
     
                    completion:^(BOOL finish){
                        
            
                        
                    }];

}
-(void) addBottemButtons
{       //bottem buttons Watch TV
        UIImage * buttonUnSelected = [UIImage imageNamed:@"nav_button.png"];
        UIImage * buttonSelected = [UIImage imageNamed:@"nav_button-selected.png"];
        float margin=20;
        UIButton * bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 35, buttonUnSelected.size.width, buttonUnSelected.size.height)];
        [bottomButton setImage:buttonUnSelected forState:UIControlStateNormal];
        [bottomButton setImage:buttonSelected forState:UIControlStateHighlighted];
        [bottomButton addTarget:self action:@selector(buttomMinimizeAnimation:) forControlEvents:UIControlEventTouchUpInside];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height)];
        label.textAlignment = UITextAlignmentCenter;
        label.text = @"Watch TV";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [bottomButton addSubview:label];
        [bottomImageView addSubview:bottomButton];
    
    
    
    
      //bottem buttons Watch NetFlix
       UIButton * bottomButton2 = [[UIButton alloc] initWithFrame:CGRectMake(80+margin+buttonSelected.size.width, 35, buttonUnSelected.size.width, buttonUnSelected.size.height)];
       [bottomButton2 setImage:buttonUnSelected forState:UIControlStateNormal];
       [bottomButton2 setImage:buttonSelected forState:UIControlStateHighlighted];
    
       UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height)];
       label2.textAlignment = UITextAlignmentCenter;
       label2.text = @"Watch NetFlix";
       label2.textColor = [UIColor whiteColor];
       label2.backgroundColor = [UIColor clearColor];
       [bottomButton2 addSubview:label2];
       [bottomImageView addSubview:bottomButton2];
    
    
       
       //bottem buttons Watch Listen To Music
       UIButton * bottomButton3 = [[UIButton alloc] initWithFrame:CGRectMake(80+2*margin+2*buttonSelected.size.width, 35, buttonUnSelected.size.width, buttonUnSelected.size.height)];
       [bottomButton3 setImage:buttonUnSelected forState:UIControlStateNormal];
       [bottomButton3 setImage:buttonSelected forState:UIControlStateHighlighted];
    
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height)];
        label3.textAlignment = UITextAlignmentCenter;
        label3.text = @"Watch HuluPlus";
        label3.textColor = [UIColor whiteColor];
        label3.backgroundColor = [UIColor clearColor];
        [bottomButton3 addSubview:label3];
        [bottomImageView addSubview:bottomButton3];
    
         //bottem buttons Watch HuluPlus
        UIButton * bottomButton4 = [[UIButton alloc] initWithFrame:CGRectMake(80+3*margin+3*buttonSelected.size.width, 35, buttonUnSelected.size.width, buttonUnSelected.size.height)];
        [bottomButton4 setImage:buttonUnSelected forState:UIControlStateNormal];
        [bottomButton4 setImage:buttonSelected forState:UIControlStateHighlighted];
    
         UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height)];
         label4.textAlignment = UITextAlignmentCenter;
         label4.text = @"Listen To Music";
         label4.textColor = [UIColor whiteColor];
         label4.backgroundColor = [UIColor clearColor];
         [bottomButton4 addSubview:label4];
         [bottomImageView addSubview:bottomButton4];
    
    
        //bottem buttons Play Playstation
        UIButton * bottomButton5 = [[UIButton alloc] initWithFrame:CGRectMake(80+4*margin+4*buttonSelected.size.width, 35, buttonUnSelected.size.width, buttonUnSelected.size.height)];
        [bottomButton5 setImage:buttonUnSelected forState:UIControlStateNormal];
        [bottomButton5 setImage:buttonSelected forState:UIControlStateHighlighted];
    
        UILabel * label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height)];
        label5.textAlignment = UITextAlignmentCenter;
        label5.text = @"Play Playstation";
        label5.textColor = [UIColor whiteColor];
        label5.backgroundColor = [UIColor clearColor];
        [bottomButton5 addSubview:label5];
        [bottomImageView addSubview:bottomButton5];
    


    
       
    
 
    
}
-(void)removeFacebookView{

    [[[toby1 subviews] objectAtIndex:0] removeFromSuperview];
    flipImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"glee_thumb.png"]];
    flipImg.frame=CGRectMake(520, 28, flipImg.frame.size.width,  flipImg.frame.size.height); 
    UITapGestureRecognizer *fliptap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fliptap:)] ;
    
    
    flipImg.userInteractionEnabled=YES;
    toby1.userInteractionEnabled=YES;
    [flipImg addGestureRecognizer:fliptap];
    
    
    
    
    [UIView transitionWithView:baseView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{}
     
                    completion:^(BOOL finish){
                        [baseView removeFromSuperview];
                        [toby1 addSubview:flipImg];
                        
                    }];
    

}


-(IBAction) doFlip :(id)sender{
    flipImg=nil;
    if(!flipImg){
    flipImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"glee_thumb.png"]];
    flipImg.frame=CGRectMake(520, 28, flipImg.frame.size.width,  flipImg.frame.size.height); 
    UITapGestureRecognizer *fliptap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fliptap:)] ;
         [flipImg addGestureRecognizer:fliptap];
    }
    
    flipImg.userInteractionEnabled=YES;
    toby1.userInteractionEnabled=YES;
   
    
    
       [UIView transitionWithView:detaialViewController.view duration:1.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
         [toby1 addSubview:flipImg];  
         flipImg.hidden=YES;
         }
         completion:^(BOOL f) { }
                   
        ];
    
      
    [self performSelector:@selector(inbetremoveWeenAnimation) withObject:flipImg afterDelay:.7];
}
-(void) inbetremoveWeenAnimation{
       [detaialViewController.view removeFromSuperview];
       flipImg.hidden=NO;
         
        [UIView transitionWithView:flipImg duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft|UIViewAnimationOptionCurveEaseOut animations:^{
            [toby1 addSubview:flipImg];  
           
            
     } completion:^(BOOL f) {}];
      
}

-(void)doAnimation{
    NSLog(@"first");
     viewSocialDetailsController = [[ViewSocialDetailsController alloc] initWithNibName:@"ViewSocialDetailsController" bundle:nil];
    
     [detaialViewController.view addSubview:viewSocialDetailsController.view];
    [UIView transitionWithView:detaialViewController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
     
    } completion:^(BOOL f){}];
    

}
-(void) setTitle{
  
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   

    favlabel.text=appDelegate.popovertitle;
    [self.view reloadInputViews];
    [self.favouriteImagePopOverController dismissPopoverAnimated:YES];
}
-(IBAction)buttomMinimizeAnimation : (id) sender{

      [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        for(UIView * aview in [bottomImageView subviews])
        {
            aview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3, 0.3);
        }} completion:^(BOOL finish) { for(UIView * aview in [bottomImageView subviews])
        {
            [aview removeFromSuperview];
        }
            [self startingActivityAnimation:sender];   
        }];
    

}
-(IBAction)startingActivityAnimation : (id) sender{
       
    
    
   
    
    UIButton *bottomButton3;
    UIImage * powerButtonImage = [UIImage imageNamed:@"poweroff.png"];
    bottomButton3 = [[UIButton alloc] initWithFrame:CGRectMake(70, 35,powerButtonImage.size.width , powerButtonImage.size.height)];
    [bottomButton3 setImage:powerButtonImage forState:UIControlStateNormal];
    [bottomImageView addSubview:bottomButton3];
    
    
    UIButton * bottomButton;
    UIImage * buttonImage = [UIImage imageNamed:@"back.png"];
    bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(70+powerButtonImage.size.width-5,35 , buttonImage.size.width,buttonImage.size.height)];
    [bottomButton setImage:buttonImage forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(bottomButtonPressed2:) forControlEvents:UIControlEventTouchUpInside];
    [bottomImageView addSubview:bottomButton];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height)];
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = UITextAlignmentCenter;
    label2.text = @"Watch TV";
    [bottomButton addSubview:label2];
    
    
    
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(500, 20, 200, 45)];
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor whiteColor];
    label2.text = @"Starting Activity....";
    [bottomImageView addSubview:label2];
    
    UIImage * loadingImage = [UIImage imageNamed:@"loading-bar.png"];
    UIImageView * loading = [[UIImageView alloc] initWithFrame:CGRectMake(400, 60, loadingImage.size.width-240, loadingImage.size.height)];
    loading.image = loadingImage;
    [bottomImageView addSubview:loading];

    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{loading.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -80, 0);} completion:
     ^(BOOL finish){ 
         [label2 removeFromSuperview];
         [loading removeFromSuperview];
         [self displayBottomButtons3];
        
     }];
  
}

-(void) displayBottomButtons3
{
    UIButton * bottomButton;
    UIImage * img1 = [UIImage imageNamed:@"touch_surface-rewind.png"];
    UIImage * img2 = [UIImage imageNamed:@"touch_surface-rewind-highlighted.png"];
    bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 40, img1.size.width, img1.size.height)];
    [bottomButton setImage:img1 forState:UIControlStateNormal];
    [bottomButton setImage:img2 forState:UIControlStateHighlighted];
    [bottomImageView addSubview:bottomButton];
   
    
    UIImage * img = [UIImage imageNamed:@"touch_surface-background.png"];
    UIImageView * background = [[UIImageView alloc] initWithFrame:CGRectMake(280+bottomButton.frame.size.width, 33, img.size.width, img.size.height-10)];
    background.userInteractionEnabled = YES;
    background.image = img;
    [bottomImageView addSubview:background];
    
   
    img1 = [UIImage imageNamed:@"touch_surface-play.png"];
    img2 = [UIImage imageNamed:@"touch_surface-pause.png"];
    bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(background.center.x-(img1.size.width/2),background.center.y-(img1.size.height/2) , img1.size.width, img1.size.height)];
    [bottomButton setImage:img1 forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(bottomBut:)forControlEvents:UIControlEventTouchUpInside];
    [bottomButton setImage:img2 forState:UIControlStateSelected];
    [bottomImageView addSubview:bottomButton];
   
    
    img1 = [UIImage imageNamed:@"touch_surface-forward.png"];
    img2 = [UIImage imageNamed:@"touch_surface-forward-highlighted.png"];
    bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(background.frame.origin.x+background.frame.size.width, 40, img1.size.width, img1.size.height)];
    [bottomButton setImage:img1 forState:UIControlStateNormal];
    [bottomButton setImage:img2 forState:UIControlStateHighlighted];
    [bottomImageView addSubview:bottomButton];
   
    
    
    img1 = [UIImage imageNamed:@"touch_surface-minus.png"];
    img2 = [UIImage imageNamed:@"touch_surface-minus-highlighted.png"];
    UIButton * bottomButton2 = [[UIButton alloc] initWithFrame:CGRectMake(bottomButton.frame.origin.x+bottomButton.frame.size.width+20, 40, img1.size.width, img1.size.height)];
    [bottomButton2 setImage:img1 forState:UIControlStateNormal];
    [bottomButton2 setImage:img2 forState:UIControlStateHighlighted];
    [bottomImageView addSubview:bottomButton2];
        
    background = [[UIImageView alloc] initWithFrame:CGRectMake(bottomButton2.frame.origin.x+bottomButton.frame.size.width, 33, img.size.width, img.size.height-10)];
    background.userInteractionEnabled = YES;
    background.image = img;
    [bottomImageView addSubview:background];
       
    img1 = [UIImage imageNamed:@"touch_surface-plus.png"];
    img2 = [UIImage imageNamed:@"touch_surface-plus-highlighted.png"];
    bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(background.frame.origin.x+background.frame.size.width, 40, img1.size.width, img1.size.height)];
    [bottomButton setImage:img1 forState:UIControlStateNormal];
    [bottomButton setImage:img2 forState:UIControlStateHighlighted];
    [bottomImageView addSubview:bottomButton];
    
    
   
    img1 = [UIImage imageNamed:@"touch_surface-mute.png"];
    img2 = [UIImage imageNamed:@"touch_surface-unmute.png"];
    bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(background.center.x-(img1.size.width/2),background.center.y-(img1.size.height/2) , img1.size.width, img1.size.height)];
    [bottomButton setImage:img1 forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(bottomBut:)forControlEvents:UIControlEventTouchUpInside];
    [bottomButton setImage:img2 forState:UIControlStateSelected];
    [bottomImageView addSubview:bottomButton];
  }



-(IBAction)fliptap:(UITapGestureRecognizer *)recognizer{
   
    watchnowbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreinfbtn  = [UIButton buttonWithType:UIButtonTypeCustom];   
    UIImage * watcnowImg = [UIImage imageNamed:@"watch-now.png"];
    UIImage * moreinfoImg = [UIImage imageNamed:@"more-info.png"];;
    watchnowbtn.frame = CGRectMake(590, 90, watcnowImg.size.width, watcnowImg.size.height);
    moreinfbtn.frame = CGRectMake(590, 150, moreinfoImg.size.width, moreinfoImg.size.height);
    [watchnowbtn setImage:watcnowImg forState:UIControlStateNormal];
    [moreinfbtn setImage:moreinfoImg forState:UIControlStateNormal];
    [sc2 insertSubview:watchnowbtn aboveSubview:flipImg];
    [sc2 insertSubview:moreinfbtn aboveSubview:flipImg];
    
 
    
    [watchnowbtn addTarget:self action:@selector(buttomMinimizeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [moreinfbtn addTarget:self action:@selector(dothis) forControlEvents:UIControlEventTouchUpInside];
    watchnowbtn.tag=2;
    moreinfbtn.tag=3;
    toby1.userInteractionEnabled=NO;    
    
        
    
}
-(void)reverseFlip{
    [UIView transitionWithView:baseView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{} completion:^(BOOL finished){
        [baseView removeFromSuperview];
        [self.view addSubview:detaialViewController.view];
    }];
}

-(void)dothis{
    
    [watchnowbtn removeFromSuperview];
    [moreinfbtn removeFromSuperview];
    watchnowbtn=Nil;
    moreinfbtn=Nil;
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState 
                     animations:^{
                         flipImg.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                                } 
                         completion:^(BOOL finished){
                         [UIView transitionWithView:flipImg duration:1.2 options:UIViewAnimationOptionTransitionFlipFromRight  animations:^{} completion:nil];
                            [self.view addSubview:detaialViewController.view];
                            detaialViewController.view.hidden=YES;
                          
                                                
                     }];
    
   
    [self performSelector:@selector(inbetWeenAnimation) withObject:flipImg afterDelay:0.8] ;  


}
-(void)inbetWeenAnimation{
    detaialViewController.view.hidden=NO;
    [flipImg removeFromSuperview];
    [UIView transitionWithView:detaialViewController.view duration:0.4 options:UIViewAnimationOptionTransitionFlipFromRight| UIViewAnimationOptionCurveEaseOut animations:^{}
       
          
       completion:^(BOOL f) {}];
        flipImg=nil;

}
-(IBAction)bottomButtonPressed2:(id)sender{
   
    NSArray *views = [bottomImageView subviews];
 
            
           [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
               for(UIView *view in views){
                   if([view isKindOfClass:[UIButton class]]){
                    view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3, 0.3);
                   }
               }
                } completion:^(BOOL finish) {
                    for(UIView * aview in [bottomImageView subviews])
                {
                    [aview removeFromSuperview];
                    [self addBottemButtons];
                }
                     
                }];
      
    
}
-(IBAction)handlFavouriteTap:(UITapGestureRecognizer *)recognizer{
    CGPoint offset1 = [scView contentOffset];

   
    CGPoint offset = [topScroll contentOffset];
   
      if(recognizer.view.tag==1){
        offset.x = -300;
          offset1.x=0;  
          
    }
    else if(recognizer.view.tag==3){
        offset.x = 350;
        offset1.x=2048;
       
    }
    else if(recognizer.view.tag==2){
        offset.x = 0;
       offset1.x=1024;
    }
    [topScroll setContentOffset:offset animated:YES];
    [scView setContentOffset:offset1 animated:YES];
    
    offset1.x=1024;
    
    if(recognizer.view.tag==5){
    
        if(!baseContoller)
        {
            
            FavouriteImagesPopOver *popOver=[[FavouriteImagesPopOver alloc] initWithStyle:UITableViewStyleGrouped];
            [popOver setContentSizeForViewInPopover:CGSizeMake(240, 340)];
            popOver.delegate=self;
            baseContoller = [[UINavigationController alloc] initWithRootViewController:popOver];
            
            favouriteImagePopOverController= [[UIPopoverController alloc] initWithContentViewController:baseContoller];
         
           
        }
         [favouriteImagePopOverController presentPopoverFromRect:CGRectMake(830,80,40,35)  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp  animated:YES];
    
    }

}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    NSLog(@"HI");
        
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
   
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        return YES;
}

@end
