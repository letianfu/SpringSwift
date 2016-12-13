//
//  NSObject+SpringBinder.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpringBinder.h"

@interface NSObject (SpringBinder)

@property(nullable,strong,nonatomic)SpringBinder *binder;

-(void)sp_start;

-(void)sp_release;

-(SpringBinder * _Nonnull)findBinderWithDelegateView:(UIView * _Nonnull)view;

@end
