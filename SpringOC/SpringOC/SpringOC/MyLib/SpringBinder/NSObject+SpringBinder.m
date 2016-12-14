//
//  NSObject+SpringBinder.m
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "NSObject+SpringBinder.h"
#import <objc/runtime.h>

static const void *Binder = &Binder;

@implementation NSObject (SpringBinder)
@dynamic binder;

-(void)sp_startWithViews:(NSArray<UIView *> * _Nonnull)views{
    
    self.binder = [SpringBinder new];
    
    [self.binder sp_startBind:self views:views];
}

-(void)sp_release{
    
    
}

-(void)setBinder:(SpringBinder *)binder{
    objc_setAssociatedObject(self, Binder, binder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(SpringBinder *)binder{
    return objc_getAssociatedObject(self, Binder);
}

@end
