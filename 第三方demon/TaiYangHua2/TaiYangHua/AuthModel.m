//
//  AuthModel.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/15.
//  Copyright © 2015年 hhly. All rights reserved.
//
#import "AuthModel.h"
#import "TYHUserInfo.h"
#import <objc/runtime.h>

@implementation AuthModel
NSString * const AccoutMsgModel = @"AccoutMsgModel";

static AuthModel *sharedInstance ;

+ (instancetype)sharedInstance
{
    
    //Thread safe singlton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    
    });
    return sharedInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInfo = [[TYHUserInfo alloc] init];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        
        Ivar *ivar = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            Ivar iva = ivar[i];
            const char *name = ivar_getName(iva);
            NSString *strName = [NSString stringWithUTF8String:name];
            
            id value = [decoder decodeObjectForKey:strName];
            
            [self setValue:value forKey:strName];
        }
        free(ivar);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    unsigned int count;
    Ivar *ivar = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar iv = ivar[i];
        const char *name = ivar_getName(iv);
        NSString *strName = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:strName];
        [encoder encodeObject:value forKey:strName];
    }
    free(ivar);
}
+ (void)saveData
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *modelObject = [NSKeyedArchiver archivedDataWithRootObject:[AuthModel sharedInstance]];
    [def setObject:modelObject forKey:AccoutMsgModel];
    [def synchronize];
}
+ (instancetype)readData
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *AccountModel = [def objectForKey:AccoutMsgModel];
    AuthModel * Account = [NSKeyedUnarchiver unarchiveObjectWithData:AccountModel];
    return Account;
}
- (void)clearLocalCache
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def removeObjectForKey:AccoutMsgModel];
    [def synchronize];
}
- (void)clearCache{
    self.companyCode = nil;
    self.loginName = nil;
    self.password = nil;
    self.onLine = nil;
    self.area = nil;
    self.deviceToken = nil;
}
@end
