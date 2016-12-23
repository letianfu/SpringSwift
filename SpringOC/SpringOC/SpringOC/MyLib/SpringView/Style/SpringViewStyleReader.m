//
//  SpringViewStyleReader.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringViewStyleReader.h"
#import "XMLDictionary.h"

@implementation SpringViewStyleReader

+(NSDictionary<NSString *,SpringViewStyleClass *> * _Nonnull)readStyleFromXMLName:(NSString * _Nonnull)xmlName{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:xmlName ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
    
    return [SpringViewStyleClass classArrayFromStyleDic:xmlDoc filename:xmlName];
}

@end
