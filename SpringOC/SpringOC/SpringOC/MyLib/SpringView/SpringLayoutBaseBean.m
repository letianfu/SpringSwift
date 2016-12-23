//
//  SpringLayoutBaseBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutBaseBean.h"

@implementation SpringLayoutBaseBean

-(instancetype _Nonnull)initWithXMLDic:(NSDictionary * _Nonnull)xmlDic{
    self = [super init];
    
    if(self){
        
        self.xmlDic = xmlDic;
        
        NSAssert(self.xmlDic, @"");
        
        [self initialXMLProperty];
        
        [self initSubViewBeans];
    }
    
    return self;
}

-(void)initialXMLProperty{
    
}

-(void)initSubViewBeans{
    
}

-(void)addSubViewForSuperView:(UIView *_Nonnull)superView{
    
}

//添加所有子view
-(void)addSubViewsForSuperView:(UIView * _Nonnull)view{
    
    if(self.subViewBeanMapper.allKeys.count == 0 ){
        return;
    }
    
    NSArray *allKeys = self.subViewBeanMapper.allKeys;
    for(NSString *key in allKeys){
        SpringLayoutBaseBean *bean = self.subViewBeanMapper[key];
        [bean addSubViewForSuperView:view];
    }
}

-(id _Nonnull)createViewInstance{
    return [[UIView alloc] init];
}

@end
