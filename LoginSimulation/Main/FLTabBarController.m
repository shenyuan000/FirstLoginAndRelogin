//
//  FLTabBarController.m
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import "FLTabBarController.h"
#import "FLNavigationController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"

@interface FLTabBarController ()

@end

@implementation FLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildViewControllers];
}
#pragma mark - Private Method
- (void)setupChildViewControllers
{
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    [self addChildViewController:homeViewController withTitle:@"Home" image:nil selectedImage:nil];
    
    MessageViewController *aboutViewController = [[MessageViewController alloc] init];
    [self addChildViewController:aboutViewController withTitle:@"Message" image:nil selectedImage:nil];
    
    MeViewController  *meViewController = [[MeViewController alloc] init];
    [self addChildViewController:meViewController withTitle:@"me" image:nil selectedImage:nil];
}

- (void)addChildViewController:(UIViewController *)childViewController withTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    childViewController.title = title;
    
    FLNavigationController *navigationController = [[FLNavigationController alloc] initWithRootViewController:childViewController];
    
    [self addChildViewController:navigationController];
}

@end
