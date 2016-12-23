//
//  SpringViewStyleReader.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringViewStyleReader.h"
#import "XMLDictionary.h"
#import "SpringViewXMLStore.h"

@implementation SpringViewStyleReader

+(NSDictionary<NSString *,SpringViewStyleClass *> * _Nonnull)readStyleFromXMLName:(NSString * _Nonnull)xmlName{
    
    NSDictionary *xmlDoc = [SpringViewXMLStore xmlDicFor:xmlName];
    
    return [SpringViewStyleClass classArrayFromStyleDic:xmlDoc filename:xmlName];
}

@end
