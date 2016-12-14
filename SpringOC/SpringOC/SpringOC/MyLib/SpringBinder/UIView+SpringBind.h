//
//  UIView+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpringBindMapper : NSObject

@property(nullable,nonatomic,strong)NSMutableDictionary *allKeyProperties;

-(NSMutableDictionary * _Nonnull)observerblePropertyList;

@end

@interface SpringBindViewMapper : SpringBindMapper

@property(nullable,nonatomic,strong)NSString *backgroundColor;

@end

@interface UIView (SpringBind)

@property(nullable,nonatomic,strong)SpringBindMapper *mapper;

+(SpringBindViewMapper * _Nonnull)sp_mapper;

-(void)sp_bindMapper:(SpringBindMapper * _Nonnull(^ _Nonnull)())makeMapper;

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue;

@end
