//
//  UITextField+SpringBind.m
//  SpringOC
//
//  Created by fuletian on 2016/12/14.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UITextField+SpringBind.h"

@implementation SpringBindTextFieldMapper

-(NSMutableDictionary * _Nonnull)sp_onBindingPropertyList{
    
    // on.name - bean.name
    NSMutableDictionary *results = [super sp_onBindingPropertyList];
    
    if(self.onTextChangedTo){
        [results setObject:self.onTextChangedTo forKey:@"onTextChangedTo"];
    }
    
    return results;
}

@end

@implementation UITextField (SpringBind)

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindTextFieldMapper * _Nonnull))makeMapper{
    
    self.mapper = [SpringBindTextFieldMapper new];
    makeMapper((SpringBindTextFieldMapper *)self.mapper);
}

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue{
    [super sp_onValueChangeWithKeyPath:keyPath newValue:newValue];
    
    
}

-(void)sp_onEventBind:(id)binder EventName:(NSString *)eventName{
    [super sp_onEventBind:binder EventName:eventName];
    
    if([eventName isEqualToString:@"onTextChangedTo"]){
        [self addTarget:self action:@selector(sp_onTextChanged) forControlEvents:UIControlEventEditingChanged];
    }
}

-(void)sp_onTextChanged{
    
    SpringBindTextFieldMapper *mapper = (SpringBindTextFieldMapper *)self.mapper;
    
    NSString *beanName = mapper.onTextChangedTo;
    NSString *newValue = self.text;
    [SpringBinder sp_postBeanName:beanName newValue:newValue];
    
}

@end
