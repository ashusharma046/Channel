//
//  ProgressiveSearchPopOverController.h
//  Channel
//
//  Created by Aneesh on 03/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
@protocol ProgressiveSearchPopOverControllerdelegate
-(void) removePopover;
-(void) dothis;
-(void) removeKeyBoard;
@end
#import <UIKit/UIKit.h>

@interface ProgressiveSearchPopOverController : UITableViewController<UIPopoverControllerDelegate>{
    id <ProgressiveSearchPopOverControllerdelegate> delegate;
    NSMutableArray *name; 
    
    NSMutableArray	*filteredListContent;	// The content filtered as a result of a search.
	NSInteger searchWasActive;
    int noresultfound;
	
}
@property(strong,nonatomic) id <ProgressiveSearchPopOverControllerdelegate> delegate;
@property (strong,nonatomic)  NSMutableArray *name; 
@property (strong,nonatomic) NSMutableArray	*filteredListContent;
@property (nonatomic) NSInteger searchWasActive;

@end
