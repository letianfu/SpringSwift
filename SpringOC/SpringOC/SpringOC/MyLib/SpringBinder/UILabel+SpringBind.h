//
//  UILabel+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SpringBind.h"

@interface SpringBindLabelMapper : SpringBindViewMapper

@property(nullable,nonatomic,strong)NSString *text;
@property(nullable,nonatomic,strong)NSString *fontColor;

@end

@interface UILabel (SpringBind)

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindLabelMapper * _Nonnull))makeMapper;

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue;

@end
