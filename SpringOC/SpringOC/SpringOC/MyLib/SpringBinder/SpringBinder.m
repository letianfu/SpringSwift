//
//  SpringBinder.m
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringBinder.h"
#import "UIView+SpringBind.h"

@interface SpringBinder()

@property(nonatomic,strong)NSObject *bean;

@end

@implementation SpringBinder

+(nonnull SpringBinder *)binderWithBean:(nonnull NSObject *)bean{
    
    SpringBinder *binder = [SpringBinder new];
    binder.bean = bean;
    return binder;
}

-(id)init{
    
    if(self){
        self.observerTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

-(void)sp_startBind:(NSObject *)bean{
    
    NSArray *keys = self.observeKeys.allKeys;
    for(NSString *key in keys){
        
        NSLog(@"开始关注:key=%@",key);
        
        [bean addObserver:self forKeyPath:key options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    }
}

-(void)sp_removeObserver:(NSObject *)bean{
    
    NSArray *keys = self.observeKeys.allKeys;
    for(NSString *key in keys){
        [bean removeObserver:self forKeyPath:key];
    }
}

-(void)sp_addDelegateView:(UIView * _Nonnull)view{
    
    if(![self.observerTable containsObject:view]){
        [self.observerTable addObject:view];
    }
}

-(void)addObserverKeys:(NSDictionary *)beanKeyProperty{
    
    NSArray *allKeys = beanKeyProperty.allKeys;
    for(NSString *key in allKeys){
        [self.observeKeys setObject:beanKeyProperty[key] forKey:key];
    }
}

-(NSMutableDictionary *)observeKeys{
    
    if (!_observeKeys) {
        _observeKeys = [NSMutableDictionary new];
    }
    
    return _observeKeys;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"收到值变化key=%@,newValue=%@",keyPath,[object valueForKey:keyPath]);
    
    id newValue = [object valueForKey:keyPath];
    
    NSArray *views = self.observerTable.allObjects;
    if(views.count){
        for(UIView *view in views){
            if([view respondsToSelector:@selector(sp_onValueChangeWithKeyPath:newValue:)]){
                [view sp_onValueChangeWithKeyPath:keyPath newValue:newValue];
            }
        }
    }
}

@end
