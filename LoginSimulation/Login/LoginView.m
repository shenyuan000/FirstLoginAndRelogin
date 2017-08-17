//
//  LoginView.m
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
/** loginBtn */
@property (nonatomic, strong) UIButton *loginButton;
/** otherThing */
@property (nonatomic, strong) UIButton *lookArroundButton;
@end

@implementation LoginView
- (UIButton *)loginButton
{
    if (!_loginButton)
    {
        UIButton *loginButton = [UIButton new];
        
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginButton setBackgroundColor:[UIColor yellowColor]];
        [loginButton setExclusiveTouch:YES];
        [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:loginButton];
        self.loginButton = loginButton;
    }
    return _loginButton;
}

- (UIButton *)lookArroundButton
{
    if (!_lookArroundButton)
    {
        UIButton *lookArroundButton = [UIButton new];
        
        [lookArroundButton setTitle:@"Look Arround" forState:UIControlStateNormal];
        [lookArroundButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lookArroundButton setBackgroundColor:[UIColor greenColor]];
        [lookArroundButton setExclusiveTouch:YES];
        [lookArroundButton addTarget:self action:@selector(lookArroundButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:lookArroundButton];
        self.lookArroundButton = lookArroundButton;
    }
    return _lookArroundButton;
}

- (void)loginButtonClicked:(UIButton *)sender{
    if ([self.loginDelegate respondsToSelector:@selector(loginView:didClickLoginBtn:)]) {
        [self.loginDelegate loginView:self didClickLoginBtn:sender];
    }
}

- (void)lookArroundButtonClicked:(UIButton *)sender{
    if ([self.loginDelegate respondsToSelector:@selector(loginView:didClickLookOtherButton:)]) {
        [self.loginDelegate loginView:self didClickLookOtherButton:sender];
    }
}

#pragma mark - Layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    
    self.loginButton.frame = CGRectMake(0, viewHeight/3, viewWidth, 44);
    self.lookArroundButton.frame = CGRectMake(0, viewHeight*2/3, viewWidth, 44);
}

@end
