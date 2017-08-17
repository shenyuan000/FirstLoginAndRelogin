//
//  LoginManager.h
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FLManagerSuccessHandle)();
typedef void(^FLManagerFailureHandle)();
typedef void(^FLManagerAllCompletionHandle)();


@interface LoginManager : NSObject

#pragma mark - login && logout
+(void)processLoginWithParameters:(NSString *)parameters
                  succcessProcess:(FLManagerSuccessHandle)sucess
                   failureProcess:(FLManagerFailureHandle)failure
             allCompletionProcess:(FLManagerFailureHandle)completion;

+(void)processLogoutSucccessProcess:(FLManagerSuccessHandle)sucess
                   failureProcess:(FLManagerFailureHandle)failure
             allCompletionProcess:(FLManagerFailureHandle)completion;

#pragma mark - skip to other where
+(void)skipToLoginViewControllerCompletion:(FLManagerAllCompletionHandle)completion;

//登陆之前
+(void)skipToHomeVCBeforeLoginCompletion:(FLManagerAllCompletionHandle)completion;
//登陆之后跳到首页
+(void)skipToHomeVCAfterLoginCompletion:(FLManagerAllCompletionHandle)completion;

@end
