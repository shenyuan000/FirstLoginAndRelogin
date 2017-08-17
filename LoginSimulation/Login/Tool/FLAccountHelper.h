//
//  FLAccountHelper.h
//  LoginSimulation
//
//  Created by yx on 2017/8/17.
//  Copyright © 2017年 yx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLAccountHelper : NSObject
+(NSString *)stringWithKey:(NSString *)key;
+(void)saveString:(NSString *)string withKey:(NSString *)key;
+(void)removedObjectForKey:(NSString *)key;
@end

@interface FLAccountHelper (optimization)

+(void)saveAccount:(NSString *)account;
+(NSString *)account;

+(void)removeAccount;
+(BOOL)isAccountExist;


@end
