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

-(id)init{
    
    if(self){
        self.observerTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

-(void)sp_startBind:(NSObject * _Nonnull)bean views:(NSArray<UIView *> * _Nonnull)views{
    
    NSMutableDictionary *hasObservedDic = [NSMutableDictionary new];
    
    for(UIView *view in views){
        [self.observerTable addObject:view];
        
        SpringBindMapper *mapper = view.mapper;
        NSArray *allBeanProp = [mapper observerblePropertyList].allKeys;
        
        for(NSString *beanProp in allBeanProp){
            
            if(!hasObservedDic[beanProp]){
            
                [hasObservedDic setObject:@"" forKey:beanProp];
                [bean addObserver:self forKeyPath:beanProp options:NSKeyValueObservingOptionNew context:nil];
            }
            
        }
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
