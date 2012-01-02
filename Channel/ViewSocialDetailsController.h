//
//  ViewSocialDetailsController.h
//  Channel
//
//  Created by Aneesh on 31/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ViewSocialDetailsControllerDelegate
-(IBAction) reverseAnimate; ;//doFlip;

@end

@interface ViewSocialDetailsController : UIViewController{
    id <ViewSocialDetailsControllerDelegate> delegate;
}
-(IBAction)reverseFlipAnimation;
-(IBAction)viewmoreInfo;
@property(nonatomic,retain) id <ViewSocialDetailsControllerDelegate> delegate;
@end
