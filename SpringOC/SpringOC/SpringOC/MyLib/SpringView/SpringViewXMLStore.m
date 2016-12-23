//
//  SpringViewXMLStore.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringViewXMLStore.h"
#import "XMLDictionary.h"

static NSMutableDictionary *__sharedDic;

@implementation SpringViewXMLStore

+(NSDictionary * _Nonnull)xmlDicFor:(NSString * _Nonnull)xmlName{
    
    NSDictionary *xmlDoc = __sharedDic[xmlName];
    if(!xmlDoc){
        NSString * filePath = [[NSBundle mainBundle] pathForResource:xmlName ofType:@"xml"];
        xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
        [SpringViewXMLStore setXMLDic:xmlDoc forXmlName:xmlName];
    }
    
    NSAssert(xmlDoc, @"%@",xmlName);
    return xmlDoc;
}

+(void)setXMLDic:(NSDictionary * _Nonnull)xmlDic forXmlName:(NSString * _Nonnull)xmlName{

    if(!__sharedDic){
        __sharedDic = [NSMutableDictionary new];
    }
    
    NSLog(@"\nxml[%@]\n%@",xmlName,xmlDic);
    
    [__sharedDic setObject:xmlDic forKey:xmlName];
}

@end
