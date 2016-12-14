//
//  UITextField+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/14.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SpringBind.h"

@interface SpringBindTextFieldMapper : SpringBindViewMapper

@property(nullable,nonatomic,strong)NSString *onTextChanged;



@end

@interface UITextField (SpringBind)

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindTextFieldMapper * _Nonnull))makeMapper;

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue;

@end
