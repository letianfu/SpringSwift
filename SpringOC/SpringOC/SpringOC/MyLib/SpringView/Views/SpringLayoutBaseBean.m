//
//  SpringLayoutBaseBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutBaseBean.h"
#import "SpringLayoutViewBuilder.h"
#import "SpringViewStyleReader.h"
#import "NSObject+SpringEx.h"

@implementation SpringLayoutBaseBean

-(instancetype _Nonnull)initWithXMLDic:(NSDictionary * _Nonnull)xmlDic styleXml:(NSString * _Nullable)styleXml{
    
    self = [super init];
    
    if(self){
        
        self.xmlDic = xmlDic;
        
        if(styleXml){
            self.styleFilename = styleXml;
            self.classMapper = [SpringViewStyleReader readStyleFromXMLName:styleXml];
        }
        
        NSAssert(self.xmlDic, @"");
        
        [self intialBean];
    }
    
    return self;
}

-(void)intialBean{
    
    [self initialXMLProperty];
    [self initSubViewBeans];
}

-(void)initialXMLProperty{
    
    self.indexId = self.xmlDic[@"_id"];
    self.styleId = self.xmlDic[@"_style"];
    self.width = self.xmlDic[@"_width"];
    self.height = self.xmlDic[@"_height"];
    self.centerInSuper = self.xmlDic[@"_centerInSuper"];
    self.offsetTo = self.xmlDic[@"_offsetTo"];
}

-(void)autoLoadMappedProperties:(Class _Nonnull)clz{
    
    NSArray *allKeys = [clz sp_allProperties];
    for(NSString *key in allKeys){
        
        NSString *value = [self propertyXMLWithName:key];
        [self setValue:value forKeyPath:key];
    }
}

//添加子view bean
-(void)initSubViewBeans{
    
    self.subViewBeanMapper = [NSMutableDictionary new];
    
    NSArray *allViewType = [SpringLayoutViewBuilder viewTypeArray];
    for(NSString *viewType in allViewType){
        
        NSDictionary *subXMLDic = self.xmlDic[viewType];
        
        if([subXMLDic isKindOfClass:[NSDictionary class]]){
            
            SpringLayoutBaseBean *bean = [SpringLayoutViewBuilder findBaseBeanWithXMLViewType:viewType xmlDic:subXMLDic styleXml:self.styleFilename observable:self.observableObj];
            
            NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
            [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
            
        }
        else if ([subXMLDic isKindOfClass:[NSArray class]]){
            
            for(NSDictionary *itemDic in subXMLDic){
                
                SpringLayoutBaseBean *bean = [SpringLayoutViewBuilder findBaseBeanWithXMLViewType:viewType xmlDic:itemDic styleXml:self.styleFilename observable:self.observableObj];
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

-(NSString * _Nullable)propertyXMLWithName:(NSString *_Nonnull)name{
    
    NSString *xmlName = [NSString stringWithFormat:@"_%@",name];
    
    if ([name containsString:@"."]) {
        
    }else{
        
        NSString *viewValue = self.xmlDic[xmlName];
        if(viewValue){
            return viewValue;
        }
        
        SpringViewStyleClass *styleClass = self.classMapper[self.styleId];
        if(styleClass){
            return [styleClass valueForKeyPath:name];
        }
        
    }
    
    return nil;
}

-(void)exeBeanPropertiesWithView:(id _Nonnull)view{
    
}

-(id _Nonnull)createViewInstance{
    return [[UIView alloc] init];
}

@end
