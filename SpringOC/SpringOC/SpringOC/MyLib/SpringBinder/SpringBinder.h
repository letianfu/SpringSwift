//
//  SpringBinder.h
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define K_VIEW_ON_EVENT             @"K_VIEW_ON_EVENT"

@interface SpringBinder : NSObject

//bean.key - view.property
@property(strong,nonatomic,nonnull)NSMutableDictionary *observeKeys;

@property(strong,nonnull,nonatomic)NSHashTable<UIView*> *observerTable;

-(void)sp_startBind:(NSObject * _Nonnull)bean views:(NSArray<UIView *> * _Nonnull)views;

-(void)sp_onViewEventNotified:(UIView * _Nonnull)view;

@end
