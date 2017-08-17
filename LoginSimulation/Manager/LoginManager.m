//
//  LoginManager.m
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import "LoginManager.h"
#import "FLAccountHelper.h"
#import "FLNavigationController.h"
#import "FLTabBarController.h"
#import "LoginViewController.h"

@implementation LoginManager
+(void)processLoginWithParameters:(NSString *)parameters succcessProcess:(FLManagerSuccessHandle)sucess failureProcess:(FLManagerFailureHandle)failure allCompletionProcess:(FLManagerFailureHandle)completion
{
    //模拟网络请求结果
    BOOL loginRequest = YES;
    if (loginRequest) {
        [FLAccountHelper saveAccount:parameters];
        !sucess ?: sucess();
        [LoginManager skipToHomeVCAfterLoginCompletion:completion];
    }
    
    //failure
    !failure ?: failure();
    //completion
    !completion ?: completion();
    
}

+(void)processLogoutSucccessProcess:(FLManagerSuccessHandle)sucess failureProcess:(FLManagerFailureHandle)failure allCompletionProcess:(FLManagerFailureHandle)completion
{
    //模拟网络请求结果
    BOOL loginRequest = YES;
    if (loginRequest) {
        [FLAccountHelper removeAccount];
        !sucess ?: sucess();
        [LoginManager skipToLoginViewControllerCompletion:completion];
    }
    
    //failure
    !failure ?: failure();
    //completion
    !completion ?: completion();
}

+(void)skipToLoginViewControllerCompletion:(FLManagerAllCompletionHandle)completion
{
    FLNavigationController *navitionController = [[FLNavigationController alloc] initWithRootViewController:[LoginViewController new]];
    [[UIApplication sharedApplication].keyWindow setRootViewController:navitionController];
    !completion ?: completion();
    
}

+(void)skipToHomeVCBeforeLoginCompletion:(FLManagerAllCompletionHandle)completion
{
    [LoginManager skipToHomeViewControllernCompletion:completion];
}

+(void)skipToHomeVCAfterLoginCompletion:(FLManagerAllCompletionHandle)completion
{
    [LoginManager skipToHomeViewControllernCompletion:completion];
}

+(void)skipToHomeViewControllernCompletion:(FLManagerAllCompletionHandle)completion
{
    [[UIApplication sharedApplication].keyWindow setRootViewController:[FLTabBarController new]];
    !completion ?: completion();
}


@end
