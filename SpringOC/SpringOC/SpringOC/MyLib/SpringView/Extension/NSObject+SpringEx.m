//
//  NSObject+SpringEx.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "NSObject+SpringEx.h"
#import <objc/runtime.h>

@implementation NSObject (SpringEx)

//runtime 获取所有属性
+(NSArray<NSString *> * _Nonnull)sp_allProperties{
    
    NSMutableArray *keys = [NSMutableArray new];
    
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    
    for(int i = 0 ; i < count ; i++){
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        [keys addObject:key];
    }
    
    return keys;
}

@end
