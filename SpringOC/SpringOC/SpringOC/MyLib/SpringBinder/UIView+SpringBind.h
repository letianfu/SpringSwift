//
//  UIView+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpringBindViewMapper : NSObject

@property(nullable,nonatomic,strong)NSString *backgroundColor;

@property(nullable,nonatomic,strong)NSMutableDictionary *allKeyProperties;

@end

@interface UIView (SpringBind)

@property(nullable,nonatomic,strong)SpringBindViewMapper *mapper;

-(void)sp_bind:(NSObject * _Nonnull)bean makeMapper:(void( ^ _Nonnull )( SpringBindViewMapper * _Nonnull ))makeMapper;

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keypath newValue:(id _Nullable)newValue;

@end
