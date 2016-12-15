//
//  SpringApplication.m
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringApplication.h"
#import "SpringResourceReader.h"
#import "XMLDictionary.h"

static SpringApplication *__sharedApp;

@interface SpringApplication()

@property(strong,nonatomic,nonnull)NSDictionary *xmlDoc;

@end

@implementation SpringApplication

+(void)launchApplicationWithXML:(NSString * _Nonnull)xml{
    
    __sharedApp = [[SpringApplication alloc] initWithXMLName:xml];
}

-(instancetype)initWithXMLName:(NSString *)name{
    if(self){
        NSString *xmlContent = [SpringResourceReader stringFromResource:name ofType:@"xml"];
        
        NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlContent];
        
        NSLog(@"%@",xmlDoc);
    }
    return self;
}

@end
