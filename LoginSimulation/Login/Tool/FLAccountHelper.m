//
//  FLAccountHelper.m
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import "FLAccountHelper.h"

static NSString *const Account_key = @"FlashLoan";

@implementation FLAccountHelper

+(NSString *)stringWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}

+ (void)saveString:(NSString *)string withKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:string forKey:key];
    [userDefaults synchronize];
}

+ (void)removedObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

@end

@implementation FLAccountHelper (optimization)

+(void)saveAccount:(NSString *)account
{
    [FLAccountHelper saveString:account withKey:Account_key];
}

+(NSString *)account
{
   return [FLAccountHelper stringWithKey:Account_key];
}

+ (void)removeAccount
{
    [FLAccountHelper removedObjectForKey:Account_key];
}

+(BOOL)isAccountExist
{
    NSString *account = [FLAccountHelper account];
    if (account && account.length > 0) {
        return YES;
    }
    
    return NO;
}


@end
