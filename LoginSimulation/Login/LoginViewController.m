//
//  LoginViewController.m
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginManager.h"

@interface LoginViewController ()<LoginViewDelegate>
@property (nonatomic, weak) LoginView *loginView;

@end

@implementation LoginViewController

- (LoginView *)loginView
{
    if (!_loginView)
    {
        LoginView *loginView = [LoginView new];
        
        [self.view addSubview:loginView];
        self.loginView = loginView;
    }
    return _loginView;
}

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginView.loginDelegate = self;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupNavigation];
    
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.loginView.frame = [UIScreen mainScreen].bounds;
}

#pragma mark - Touch Event
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Layout
- (void)setupNavigation
{
    self.navigationItem.title = @"Login";
}

#pragma mark - loginView Delegate

- (void)loginView:(LoginView *)loginView didClickLookOtherButton:(UIButton *)button
{
    
    [LoginManager skipToHomeVCBeforeLoginCompletion:nil];
}

- (void)loginView:(LoginView *)loginView didClickLoginBtn:(UIButton *)btn
{
 
    [LoginManager processLoginWithParameters:@"张三" succcessProcess:^{
        
    } failureProcess:^{
        
    } allCompletionProcess:nil];

}

@end
