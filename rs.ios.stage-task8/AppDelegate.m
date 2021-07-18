//
//  AppDelegate.m
//  rs.ios.stage-task8
//
//  Created by dev on 15.07.21.
//

#import "AppDelegate.h"
#import "MKMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc = [[MKMainViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
