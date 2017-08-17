
//
//  MeViewController.m
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import "MeViewController.h"
#import "FLAccountHelper.h"
#import "FLNavigationController.h"
#import "FLTabBarController.h"
#import "LoginViewController.h"

@interface MeViewController ()
@property (nonatomic, weak) UIButton *button;
@end

@implementation MeViewController

#pragma mark - Controls
- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setTitle:@"Logout" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        self.button = button;
    }
    return _button;
}

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.button.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-44)/2, [UIScreen mainScreen].bounds.size.width, 44);
}

#pragma mark - Touch Event
- (void)buttonClicked:(UIButton *)button
{
    [FLAccountHelper removeAccount];
    [UIApplication sharedApplication].keyWindow.rootViewController = [[FLNavigationController alloc] initWithRootViewController:[LoginViewController new]];
}

@end
