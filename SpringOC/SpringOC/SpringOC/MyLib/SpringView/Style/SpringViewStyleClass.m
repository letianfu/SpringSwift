//
//  SpringViewStyleClass.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringViewStyleClass.h"

@implementation SpringViewStyleClass

+(NSDictionary<NSString *,SpringViewStyleClass *> * _Nonnull)classArrayFromStyleDic:(NSDictionary * _Nonnull)styleDic filename:(NSString * _Nonnull)filename{
    
    NSMutableDictionary *mapper = [NSMutableDictionary new];
    
    id classDic = styleDic[@"class"];
    if([classDic isKindOfClass:[NSDictionary class]]){
        SpringViewStyleClass *styleClassBean = [[SpringViewStyleClass alloc] initWithClassDic:classDic];
        styleClassBean.fileName = filename;
        [mapper setObject:styleClassBean forKey:styleClassBean.indexId];
    }
    else if([classDic isKindOfClass:[NSArray class]]){
        
        for(NSDictionary *item in classDic){
            SpringViewStyleClass *styleClassBean = [[SpringViewStyleClass alloc] initWithClassDic:item];
            styleClassBean.fileName = filename;
            [mapper setObject:styleClassBean forKey:styleClassBean.indexId];
        }
    }
    
    return mapper;
}

-(instancetype _Nonnull)initWithClassDic:(NSDictionary * _Nonnull)classDic{
    self = [super init];
    if(self){
        
        self.indexId = classDic[@"_id"];
        self.backgroundColor = classDic[@"backgroundColor"];
        self.borderColor = classDic[@"borderColor"];
        self.titleForNormal = classDic[@"titleForNormal"];
        self.titleColorForNormal = classDic[@"titleColorForNormal"];
    }
    return self;
}

@end
