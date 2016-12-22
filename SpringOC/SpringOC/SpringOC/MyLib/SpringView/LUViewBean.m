//
//  LUViewBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "LUViewBean.h"

@implementation LUViewBean

-(id)initWithXMLDoc:(NSDictionary * _Nonnull)xmlDic{
    self = [super init];
    
    if(self){
        self.indexId = xmlDic[@"_id"];
        
        [self initSubviews:xmlDic[@"View"]];
    }
    
    return self;
}
    
    -(void)initSubviews:(id)xmlDic{
        
        if(!xmlDic){
            return;
        }
        
        self.subViewBeans = [NSMutableArray new];
        
        if([xmlDic isKindOfClass:[NSDictionary class]]){
            
            LUViewBean *bean = [[LUViewBean alloc] initWithXMLDoc:xmlDic];
            [self.subViewBeans addObject:bean];
            
        }
        else if ([xmlDic isKindOfClass:[NSArray class]]){
            
            for(NSDictionary *itemDic in xmlDic){
                
                LUViewBean *bean = [[LUViewBean alloc] initWithXMLDoc:itemDic];
                [self.subViewBeans addObject:bean];
            }
        }
    }

@end
