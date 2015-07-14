//
//  RootViewController.m
//  MaternalAndChild
//
//  Created by 陈奕涛 on 15/7/13.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "RootViewController.h"
#import "DiscoverViewController.h"
#import "FriendsViewController.h"
#import "MerchantViewController.h"
#import "MineViewController.h"
#import "InteractionViewController.h"

@implementation RootViewController

#pragma mark - sysMethod
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

    [self initVC];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

}

#pragma mark - usreMethod
- (void)initVC {
    UITabBarItem* discoverItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"icon_guanbi"] tag:0];

    DiscoverViewController* discoverViewController = [[DiscoverViewController alloc] init];
    [discoverViewController setTabBarItem:discoverItem];
    UINavigationController* discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverViewController];

    UITabBarItem* friendsItem = [[UITabBarItem alloc] initWithTitle:@"圈子" image:[UIImage imageNamed:@"icon_guanbi"] tag:1];
    FriendsViewController* friendsViewController = [[FriendsViewController alloc] init];
    [friendsViewController setTitle:@"圈子"];
    [friendsViewController setTabBarItem:friendsItem];
    UINavigationController* friendsNav = [[UINavigationController alloc] initWithRootViewController:friendsViewController];

    UITabBarItem* interactionItem = [[UITabBarItem alloc] initWithTitle:@"互动" image:[UIImage imageNamed:@"icon_guanbi"] tag:2];
    InteractionViewController* interactionViewController = [[InteractionViewController alloc] init];
    [interactionViewController setTitle:@"互动"];
    [interactionViewController setTabBarItem:interactionItem];
    UINavigationController* interactionNav = [[UINavigationController alloc] initWithRootViewController:interactionViewController];

    UITabBarItem* merchantItem = [[UITabBarItem alloc] initWithTitle:@"商家" image:[UIImage imageNamed:@"icon_guanbi"] tag:3];
    MerchantViewController* merchantViewController = [[MerchantViewController alloc] init];
    [merchantViewController setTitle:@"商家"];
    [merchantViewController setTabBarItem:merchantItem];
    UINavigationController* merchantNav = [[UINavigationController alloc] initWithRootViewController:merchantViewController];

    UITabBarItem* mineItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"icon_guanbi"] tag:4];
    MineViewController* mineViewController = [[MineViewController alloc] init];
    [mineViewController setTitle:@"我的"];
    [mineViewController setTabBarItem:mineItem];
    UINavigationController* mineNav = [[UINavigationController alloc] initWithRootViewController:mineViewController];

    self.viewControllers = [NSArray arrayWithObjects:discoverNav ,friendsNav ,interactionNav ,merchantNav , mineNav, nil];

}

@end
