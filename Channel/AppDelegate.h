//
//  AppDelegate.h
//  Channel
//
//  Created by Aneesh on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableString *popovertitle;
  
    NSInteger pathRow;
    NSInteger pathSection;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableString *popovertitle;
@property (assign, nonatomic) NSInteger pathRow;
@property (assign, nonatomic) NSInteger pathSection;
@end
