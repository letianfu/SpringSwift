//
//  SpringLayoutViewBuilder.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutViewBuilder.h"
#import "XMLDictionary.h"
#import "SpringViewStyleReader.h"
#import "SpringLayoutLabelBean.h"
#import "SpringLayoutImageViewBean.h"
#import "SpringViewXMLStore.h"

static NSMutableArray *__viewTypeArray = nil;

@implementation SpringLayoutViewBuilder

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName style:(NSString * _Nullable)styleXMLName superView:(UIView *_Nonnull)superView{
    
    [[self class] setArrayForViewType];
    
    NSDictionary *xmlDoc = [SpringViewXMLStore xmlDicFor:xmlName];
    
    NSString *rootType = xmlDoc[@"__name"];
    SpringLayoutBaseBean *viewBean = [[self class] findBaseBeanWithXMLViewType:rootType xmlDic:xmlDoc styleXml:styleXMLName];
    [viewBean addSubViewForSuperView:superView];
}

+(SpringLayoutBaseBean * _Nullable)findBaseBeanWithXMLViewType:(NSString * _Nonnull)viewType xmlDic:(NSDictionary * _Nonnull)xmlDic styleXml:(NSString * _Nullable)styleXml{
    
    if([viewType isEqualToString:@"View"]){
        return [[SpringLayoutViewBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    else if([viewType isEqualToString:@"Label"]){
        return [[SpringLayoutLabelBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    else if([viewType isEqualToString:@"ImageView"]){
        return [[SpringLayoutImageViewBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    
    return nil;
}

+(void)setArrayForViewType{
    
    __viewTypeArray = [NSMutableArray new];
    [__viewTypeArray addObject:@"View"];
    [__viewTypeArray addObject:@"Label"];
    [__viewTypeArray addObject:@"ImageView"];
}

+(NSMutableArray * _Nonnull)viewTypeArray{
    return __viewTypeArray;
}

@end
