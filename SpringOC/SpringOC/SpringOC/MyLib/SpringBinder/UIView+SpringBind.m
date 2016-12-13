//
//  UIView+SpringBind.m
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UIView+SpringBind.h"
#import <objc/runtime.h>
#import "SpringBinder.h"
#import "NSObject+SpringBinder.h"

@implementation SpringBindViewMapper


-(NSMutableDictionary *)observerblePropertyList{
    
    //bean.key - view.property
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    unsigned pCount;
    objc_property_t *properties = class_copyPropertyList([self class], &pCount);
    for(int i = 0 ; i < pCount ; i++){
        objc_property_t property = properties[i];
        
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        NSString *value = [self valueForKey:name];
        
        if(value){
            [results setObject:name forKey:value];
        }
    }
    
    self.allKeyProperties = results;
    
    return results;
}

@end

static const void *Mapper = &Mapper;

@implementation UIView (SpringBind)
@dynamic mapper;

-(void)sp_bind:(NSObject * _Nonnull)bean makeMapper:(void( ^ _Nonnull )( SpringBindViewMapper * _Nonnull ))makeMapper{
    
    self.mapper = [SpringBindViewMapper new];
    makeMapper(self.mapper);
    
    SpringBinder *binder = [bean findBinderWithDelegateView:self];
    [binder addObserverKeys:[self.mapper observerblePropertyList]];
    
}

-(SpringBindViewMapper *)mapper{
    
    return objc_getAssociatedObject(self, Mapper);
}

-(void)setMapper:(SpringBindViewMapper *)mapper{
    objc_setAssociatedObject(self, Mapper, mapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)updateViewProperty:(NSString *)property value:(id)value{
    
    if([property isEqualToString:@"backgroundColor"]){
        self.backgroundColor = value;
    }
}

#pragma mark - 回调
-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keypath newValue:(id _Nullable)newValue{
    
    NSLog(@"%@",self.mapper.allKeyProperties);
    
    [self updateViewProperty:self.mapper.allKeyProperties[keypath] value:newValue];
}

@end
