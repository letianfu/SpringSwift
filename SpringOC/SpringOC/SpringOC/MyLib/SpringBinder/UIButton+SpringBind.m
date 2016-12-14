//
//  UIButton+SpringBind.m
//  SpringOC
//
//  Created by fuletian on 2016/12/14.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UIButton+SpringBind.h"

@implementation SpringBindButtonMapper

-(NSMutableDictionary *)sp_onBindingPropertyList{
    NSMutableDictionary *results = [super sp_onBindingPropertyList];
    
    if(self.onClickCall){
        [results setObject:self.onClickCall forKey:@"onClickCall"];
    }
    
    return results;
}

@end

@implementation UIButton (SpringBind)

-(void)sp_bindMapper:(void (^)(SpringBindButtonMapper * _Nonnull))makeMapper{
    SpringBindButtonMapper *mapper = [SpringBindButtonMapper new];
    makeMapper(mapper);
    
    self.mapper = mapper;
}

-(void)sp_onValueChangeWithKeyPath:(NSString *)keyPath newValue:(id)newValue{
    [super sp_onValueChangeWithKeyPath:keyPath newValue:newValue];
}

-(void)sp_onEventBind:(SpringBinder *)binder EventName:(NSString *)eventName{
    [super sp_onEventBind:binder EventName:eventName];
    
    if([eventName isEqualToString:@"onClickCall"]){
        
        [self addTarget:self action:@selector(sp_onClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)sp_onClick{
    SpringBindButtonMapper *mapper = (SpringBindButtonMapper *)self.mapper;
    
    NSString *beanMethodName = mapper.onClickCall;
    
    [SpringBinder sp_postBeanMethodName:beanMethodName];
    
}

@end
