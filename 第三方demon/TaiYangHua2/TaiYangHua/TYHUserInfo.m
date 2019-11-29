//
//  TYHUserInfo.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/22.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHUserInfo.h"
#import <objc/runtime.h>

@implementation TYHUserInfo
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
@end
