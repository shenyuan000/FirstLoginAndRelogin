//
//  LoginView.h
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginView;
@protocol LoginViewDelegate <NSObject>

@optional
- (void)loginView:(LoginView *)loginView didClickLoginBtn:(UIButton *)btn;
- (void)loginView:(LoginView *)loginView didClickLookOtherButton:(UIButton *)button;


@end

@interface LoginView : UIView

@property (nonatomic, weak) id<LoginViewDelegate> loginDelegate;
@end
