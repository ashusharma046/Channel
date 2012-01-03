//
//  FavouriteImagesPopOver.h
//  Channel
//
//  Created by Aneesh on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
@protocol favouriteImagePopOverdelegate
-(void) setTitle;
@end
#import <UIKit/UIKit.h>

@interface FavouriteImagesPopOver : UITableViewController<UIPopoverControllerDelegate>{
id <favouriteImagePopOverdelegate> delegate;
      
}
@property(strong,nonatomic) id <favouriteImagePopOverdelegate> delegate;
@end
