//
//  SpringProtocolMapper.m
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringProtocolMapper.h"
#import "XMLDictionary.h"
#import "SpringXMLBean.h"
#import "YYModel.h"

@interface SpringProtocolMapper()

@property(nonatomic,nonnull,strong)SpringXMLBean *xmlBean;

@property(nonnull,nonatomic,strong)NSMutableDictionary<NSString *,SpringXMLModule *> *moduleMapper;

@end

@implementation SpringProtocolMapper

-(id)initWithXML:(NSString *)xml{
    
    if(self){
        
        NSString * filePath = [[NSBundle mainBundle] pathForResource:xml ofType:@"xml"];
        NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
        NSLog(@"%@",xmlDoc);
        
        self.xmlBean = [SpringXMLBean yy_modelWithJSON:xmlDoc];
        
        self.moduleMapper = [NSMutableDictionary new];
        
        for(SpringXMLModule *bean in self.xmlBean.modules){
            [self.moduleMapper setObject:bean forKey:bean.protocolName];
        }
    }
    
    return self;
}

-(id _Nonnull)createInstanceWithProtocol:(NSString * _Nonnull)protocolName{
    
    SpringXMLModule *module = self.moduleMapper[protocolName];
    
    if(module){
        Class clz = NSClassFromString([NSString stringWithFormat:@"SpringOC.%@",module.beanName]);
        id value = [[clz alloc] init];
        return value;
    }
    
    return nil;
}

@end
