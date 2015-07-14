//
//  AppDelegate.h
//  MaternalAndChild
//
//  Created by 陈奕涛 on 15/7/13.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController* rootViewController;

@property (assign, nonatomic) NSInteger tabbarHeight;

@end

