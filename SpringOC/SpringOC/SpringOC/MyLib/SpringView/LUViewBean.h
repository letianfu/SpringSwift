//
//  LUViewBean.h
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUViewBean : NSObject
    
@property(nullable,strong,nonatomic)NSString *indexId;
    
@property(nullable,strong,nonatomic)NSMutableArray<LUViewBean *> *subViewBeans;
    
-(id)initWithXMLDoc:(NSDictionary * _Nonnull)xmlDic;

@end
