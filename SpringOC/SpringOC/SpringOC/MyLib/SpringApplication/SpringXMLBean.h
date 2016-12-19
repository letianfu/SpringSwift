//
//  SpringXMLBean.h
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringXMLModule : NSObject

@property(strong,nonatomic,nonnull)NSString *name;
@property(strong,nonatomic,nonnull)NSString *protocolName;
@property(strong,nonatomic,nonnull)NSString *beanName;

@end

@interface SpringXMLBean : NSObject

@property(strong,nonnull,nonatomic)NSArray<SpringXMLModule *> *modules;

@end
