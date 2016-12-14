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
    
    if(self.onTextChanged){
        [results setObject:self.onTextChanged forKey:@"onTextChanged"];
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
    
    if([eventName isEqualToString:@"onTextChanged"]){
        [self addTarget:self action:@selector(sp_onTextChanged) forControlEvents:UIControlEventEditingChanged];
    }
}

-(void)sp_onTextChanged{
    
    SpringBindTextFieldMapper *mapper = (SpringBindTextFieldMapper *)self.mapper;
    
    NSString *beanName = mapper.onTextChanged;
    NSString *newValue = self.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:K_VIEW_ON_EVENT object:nil userInfo:@{@"beanName":beanName,@"newValue":newValue}];
    
}

@end
