//
//  UIView+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpringBinder.h"

@interface SpringBindMapper : NSObject

//观察bean的属性与view的属性绑定，bean.name-view.name
-(NSMutableDictionary * _Nonnull)sp_observerblePropertyList;

//观察view的事件与bean的属性绑定，on.name - bean.name
-(NSMutableDictionary * _Nonnull)sp_onBindingPropertyList;

@end

@interface SpringBindViewMapper : SpringBindMapper

@property(nullable,nonatomic,strong)NSString *backgroundColor;
@property(nullable,nonatomic,strong)NSString *borderColor;

@end

@interface UIView (SpringBind)

@property(nullable,nonatomic,strong)SpringBindMapper *mapper;

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindViewMapper * _Nonnull))makeMapper;

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue;

-(void)sp_onEventBind:(SpringBinder * _Nonnull)binder EventName:(NSString * _Nonnull)eventName;

@end
