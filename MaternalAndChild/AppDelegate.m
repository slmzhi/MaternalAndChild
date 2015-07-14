//
//  AppDelegate.m
//  MaternalAndChild
//
//  Created by 陈奕涛 on 15/7/13.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "AppDelegate.h"
#import "sys/utsname.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    RootViewController* rootViewController;
}

@synthesize rootViewController;

#pragma mark - sysMethod
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self deviceVersion];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    rootViewController = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = nav;

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - userMethod
- (void)deviceVersion {
    NSString* sDevice = [[NSUserDefaults standardUserDefaults] objectForKey:@"CurrentDevicesType"];
    if (sDevice) {
        if ([sDevice isEqualToString:@"iPhone7,1"]) {
            self.tabbarHeight = 147/2.0;
        } else {
            self.tabbarHeight = 98/2.0;
        }

        return;
    } else {
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        [[NSUserDefaults standardUserDefaults] setValue:deviceString forKey:@"CurrentDevicesType"];
        [self deviceVersion];
    }

}

@end
