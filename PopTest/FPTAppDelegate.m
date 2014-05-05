//
//  FPTAppDelegate.m
//  PopTest
//
//  Created by Rahul Agrawal on 29/04/2014.
//  Copyright (c) 2014 Rahul Agrawal. All rights reserved.
//

#import "FPTAppDelegate.h"
#import <POP/POP.h>

@interface FPTAppDelegate ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic) BOOL toggleState;

@end

@implementation FPTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    [self configureView];
    [self configureButton];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)configureView {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 300)];
    self.view.backgroundColor =  [UIColor redColor];
    [self.window addSubview:self.view];
}

- (void)configureButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 350, 220, 100);
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button];
}

- (void)buttonPressed:(id)sender {
    
    self.toggleState = !self.toggleState;
    
//    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width-20, self.view.bounds.size.height-20)];
//    animation.duration = 1;
//    [self.view pop_addAnimation:animation forKey:@"animation"];


    if (self.toggleState) {
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(10, 10, 300, 400)];
        [self.view pop_addAnimation:anim forKey:@"size"];
    } else {
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(50, 50, 200, 300)];
        [self.view pop_addAnimation:anim forKey:@"size"];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
