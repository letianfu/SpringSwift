//
//  SpringApplication.m
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringApplication.h"

static SpringApplication *__sharedApp;
static SpringProtocolMapper *__sharedProtocolMapper;

@implementation SpringApplication

+(void)installAppWithXML:(NSString * _Nonnull)xmlName{
    __sharedApp = [SpringApplication new];
    __sharedProtocolMapper = [[SpringProtocolMapper alloc] initWithXML:xmlName];
}

+(SpringApplication * _Nonnull)shareApp{
    
    return __sharedApp;
}

+(SpringProtocolMapper * _Nonnull)shareProtocolMapper{
    
    return __sharedProtocolMapper;
}

@end
