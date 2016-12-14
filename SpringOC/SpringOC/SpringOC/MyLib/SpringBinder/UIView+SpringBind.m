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

-(NSMutableDictionary *)sp_observerblePropertyList{
    
    //bean.key - view.property
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    return results;
}

@end

@implementation SpringBindViewMapper

-(NSMutableDictionary *)sp_observerblePropertyList{
    NSMutableDictionary *results = [super sp_observerblePropertyList];
    
    if(self.backgroundColor){
        [results setObject:@"backgroundColor" forKey:self.backgroundColor];
    }
    
    if(self.borderColor){
        [results setObject:@"borderColor" forKey:self.borderColor];
    }
    
    return results;
}

@end

static const void *Mapper = &Mapper;

@implementation UIView (SpringBind)
@dynamic mapper;

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindViewMapper * _Nonnull))makeMapper{
    
    self.mapper = [SpringBindViewMapper new];
    makeMapper((SpringBindViewMapper *)self.mapper);
}

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue{
    
    NSString *viewProp = [self.mapper sp_observerblePropertyList][keyPath];
    if([viewProp isEqualToString:@"backgroundColor"]){
        self.backgroundColor = newValue;
    }
    
    if([viewProp isEqualToString:@"borderColor"]){
        
        if([newValue isKindOfClass:[UIColor class]]){
            UIColor *color = (UIColor *)newValue;
            self.layer.borderColor = color.CGColor;
        }else{
            NSLog(@"%@ should be kind of UIColor",keyPath);
        }
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
