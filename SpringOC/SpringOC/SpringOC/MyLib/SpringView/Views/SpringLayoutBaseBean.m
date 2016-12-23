//
//  SpringLayoutBaseBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutBaseBean.h"
#import "SpringLayoutViewBuilder.h"

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
    
    self.indexId = self.xmlDic[@"_id"];
}

//添加子view bean
-(void)initSubViewBeans{
    
    self.subViewBeanMapper = [NSMutableDictionary new];
    
    NSArray *allViewType = [SpringLayoutViewBuilder viewTypeArray];
    for(NSString *viewType in allViewType){
        
        NSDictionary *subXMLDic = self.xmlDic[viewType];
        
        if([subXMLDic isKindOfClass:[NSDictionary class]]){
            
            SpringLayoutBaseBean *bean = [SpringLayoutViewBuilder findBaseBeanWithXMLViewType:viewType xmlDic:subXMLDic];
            
            NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
            [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
            
        }
        else if ([subXMLDic isKindOfClass:[NSArray class]]){
            
            for(NSDictionary *itemDic in subXMLDic){
                
                SpringLayoutBaseBean *bean = [SpringLayoutViewBuilder findBaseBeanWithXMLViewType:viewType xmlDic:itemDic];
                NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
                [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
            }
        }
    }
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

-(void)exeBeanPropertiesWithView:(id _Nonnull)view{
    
}

-(id _Nonnull)createViewInstance{
    return [[UIView alloc] init];
}

@end
