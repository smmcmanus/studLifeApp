//
//  AppDelegate.m
//  studLifeApp
//
//  Created by Labuser on 11/17/15.
//  Copyright (c) 2015 WUSTL. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePage.h"
#import "SportsPage.h"
#import "NewsPage.h"
#import "ForumPage.h"
#import "ScenePage.h"
#import "CadenzaPage.h"
#import "SearchPage.h"
#import "ArticleViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UITabBarController * tabBar = [[UITabBarController alloc] init];
    
    UINavigationController * homeController = [[UINavigationController alloc] init];
    UINavigationController * newsController = [[UINavigationController alloc] init];
    UINavigationController * sportsController = [[UINavigationController alloc] init];
    UINavigationController * forumController = [[UINavigationController alloc] init];
    UINavigationController * sceneController = [[UINavigationController alloc] init];
    UINavigationController * cadenzaController = [[UINavigationController alloc] init];
    UINavigationController * searchController = [[UINavigationController alloc] init];
    
    HomePage * first = [[HomePage alloc] initWithNibName:@"HomePage" bundle:nil];
    NewsPage * second = [[NewsPage alloc] initWithNibName:@"NewsPage" bundle:nil];
    SportsPage * third = [[SportsPage alloc] initWithNibName:@"SportsPage" bundle:nil];
    ForumPage * fourth = [[ForumPage alloc] initWithNibName:@"ForumPage" bundle:nil];
    ScenePage * fifth = [[ScenePage alloc] initWithNibName:@"ScenePage" bundle:nil];
    CadenzaPage * sixth = [[CadenzaPage alloc] initWithNibName:@"CadenzaPage" bundle:nil];
    SearchPage * seventh = [[SearchPage alloc] initWithNibName:@"SearchPage" bundle:nil];
    
    [homeController pushViewController:first animated:NO];
    [newsController pushViewController:second animated:NO];
    [sportsController pushViewController:third animated:NO];
    [forumController pushViewController:fourth animated:NO];
    [sceneController pushViewController:fifth animated:NO];
    [cadenzaController pushViewController:sixth animated:NO];
    [searchController pushViewController:seventh animated:NO];
    
    
    tabBar.viewControllers = [NSArray arrayWithObjects: homeController, newsController, sportsController, forumController, sceneController, cadenzaController, searchController, nil];
    
    homeController.tabBarItem.title = @"Home Page";
    newsController.tabBarItem.title = @"News Page";
    sportsController.tabBarItem.title = @"Sports Page";
    forumController.tabBarItem.title = @"Forum Page";
    sceneController.tabBarItem.title = @"Scene Page";
    cadenzaController.tabBarItem.title = @"Cadenza Page";
    searchController.tabBarItem.title = @"Search";
    
    self.window.rootViewController = tabBar;
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

@end
