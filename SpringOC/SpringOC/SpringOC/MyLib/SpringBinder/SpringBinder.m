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

@property(weak,nullable,nonatomic)NSObject *bean;

@end

@implementation SpringBinder

+(void)sp_postBeanName:(NSString * _Nonnull)beanName newValue:(NSString * _Nonnull)newValue{
    
    [[self class] sp_postBeanName:beanName beanMethodName:nil newValue:newValue];
}
+(void)sp_postBeanMethodName:(NSString * _Nonnull)beanMethodName{
    
    [[self class] sp_postBeanName:nil beanMethodName:beanMethodName newValue:nil];
    
}
+(void)sp_postBeanMethodName:(NSString * _Nonnull)beanMethodName newValue:(NSString * _Nonnull)newValue{
    
    [[self class] sp_postBeanName:nil beanMethodName:beanMethodName newValue:newValue];
}

+(void)sp_postBeanName:(NSString *)beanName beanMethodName:(NSString *)beanMethodName newValue:(NSString *)newValue{
    
    NSMutableDictionary *userinfo = @{}.mutableCopy;
    
    if(beanName){
        userinfo[@"beanName"] = beanName;
    }
    
    if(beanMethodName){
        userinfo[@"beanMethodName"] = beanMethodName;
    }
    
    if(newValue){
        userinfo[@"newValue"] = newValue;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:K_VIEW_ON_EVENT object:nil userInfo:userinfo];
    
}

-(id)init{
    
    if(self){
        self.observerTable = [NSHashTable weakObjectsHashTable];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sp_onViewEventNotified:) name:K_VIEW_ON_EVENT object:nil];
    }
    
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)sp_startBind:(NSObject * _Nonnull)bean views:(NSArray<UIView *> * _Nonnull)views{
    
    self.bean = bean;
    
    NSMutableDictionary *hasObservedDic = [NSMutableDictionary new];
    
    for(UIView *view in views){
        [self.observerTable addObject:view];
        
        SpringBindMapper *mapper = view.mapper;
        
        //bean的属性监听
        NSArray *allBeanProp = [mapper sp_observerblePropertyList].allKeys;
        for(NSString *beanProp in allBeanProp){
            
            if(!hasObservedDic[beanProp]){
            
                [hasObservedDic setObject:@"" forKey:beanProp];
                [bean addObserver:self forKeyPath:beanProp options:NSKeyValueObservingOptionNew context:nil];
            }
        }
        
        //view的事件监听
        NSArray *onEventNames = [mapper sp_onBindingPropertyList].allKeys;
        for(NSString *eventName in onEventNames){
            [view sp_onEventBind:self EventName:eventName];
        }
    }
}

-(NSMutableDictionary *)observeKeys{
    
    if (!_observeKeys) {
        _observeKeys = [NSMutableDictionary new];
    }
    
    return _observeKeys;
}

//view事件通知
-(void)sp_onViewEventNotified:(NSNotification * _Nonnull)note{
    
    NSString *beanName = note.userInfo[@"beanName"];
    NSString *beanMethodName = note.userInfo[@"beanMethodName"];
    id newValue = note.userInfo[@"newValue"];
    
    if(beanName){
        
        if(self.bean){
            [self.bean setValue:newValue forKeyPath:beanName];
        }
    }
    else if(beanMethodName){
        
        if(self.bean){
            SEL method = NSSelectorFromString(beanMethodName);
            if([beanMethodName hasSuffix:@":"]){
                if([self.bean respondsToSelector:method]){
                    [self.bean performSelector:method withObject:newValue];
                }else{
                    NSLog(@"%@ not found in class %@",beanMethodName,[self.bean class]);
                }
            }else{
                if([self.bean respondsToSelector:method]){
                    [self.bean performSelector:method];
                }else{
                    NSLog(@"%@ not found in class %@",beanMethodName,[self.bean class]);
                }
            }
            
        }
    }
    else{
        NSLog(@"出错了[SpringBinder->sp_onViewEventNotified:]");
    }
}

//bean的属性值发生变化
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
