//
//  UIView+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpringBindMapper : NSObject

-(NSMutableDictionary * _Nonnull)sp_observerblePropertyList;

@end

@interface SpringBindViewMapper : SpringBindMapper

@property(nullable,nonatomic,strong)NSString *backgroundColor;
@property(nullable,nonatomic,strong)NSString *borderColor;

@end

@interface UIView (SpringBind)

@property(nullable,nonatomic,strong)SpringBindMapper *mapper;

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindViewMapper * _Nonnull))makeMapper;

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue;

@end
