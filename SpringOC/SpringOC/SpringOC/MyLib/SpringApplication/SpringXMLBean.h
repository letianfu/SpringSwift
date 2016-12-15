//
//  SpringAppBean.h
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringBeanController : NSObject

@property(nonatomic,strong)NSString *_class;

@end

@interface SpringBeanTabController : NSObject

@property(nonatomic,strong)NSArray<SpringBeanController *> * controllers;

@end

@interface SpringBeanApp : NSObject

@property(nonatomic,strong)SpringBeanTabController *tabController;

@end
