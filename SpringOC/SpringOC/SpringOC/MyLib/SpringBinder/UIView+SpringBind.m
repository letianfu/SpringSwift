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

@implementation SpringBindMapper

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
    
    NSLog(@"%@-%@",self,results);
    
    return results;
}

@end

@implementation SpringBindViewMapper

@end

static const void *Mapper = &Mapper;

@implementation UIView (SpringBind)
@dynamic mapper;

+(SpringBindViewMapper * _Nonnull)sp_mapper{
    
    return [SpringBindViewMapper new];
}

-(void)sp_bindMapper:(SpringBindMapper * _Nonnull(^ _Nonnull)())makeMapper{
    
    self.mapper = makeMapper();
}

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue{
    
    NSLog(@"=%@",self.mapper.allKeyProperties);
    
    NSString *viewProp = self.mapper.allKeyProperties[keyPath];
    if([viewProp isEqualToString:@"backgroundColor"]){
        self.backgroundColor = newValue;
    }
}

#pragma mark //setter - getter
-(SpringBindMapper *)mapper{
    
    return objc_getAssociatedObject(self, Mapper);
}

-(void)setMapper:(SpringBindMapper *)mapper{
    objc_setAssociatedObject(self, Mapper, mapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
