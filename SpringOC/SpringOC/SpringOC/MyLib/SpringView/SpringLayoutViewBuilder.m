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
#import "SpringLayoutButtonBean.h"

static NSMutableArray *__viewTypeArray = nil;

@implementation SpringLayoutViewBuilder

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName style:(NSString * _Nullable)styleXMLName superView:(UIView *_Nonnull)superView observable:(id<SpringViewObservable> _Nullable)observaleObj{
    
    [[self class] setArrayForViewType];
    
    NSDictionary *xmlDoc = [SpringViewXMLStore xmlDicFor:xmlName];
    
    NSString *rootType = xmlDoc[@"__name"];
    SpringLayoutBaseBean *viewBean = [[self class] findBaseBeanWithXMLViewType:rootType xmlDic:xmlDoc styleXml:styleXMLName observable:observaleObj];
    
    [viewBean addSubViewForSuperView:superView];
}

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName style:(NSString * _Nullable)styleXMLName superView:(UIView *_Nonnull)superView{
    
    [[self class] buildXMLViewFrom:xmlName style:styleXMLName superView:superView observable:nil];
}

+(SpringLayoutBaseBean * _Nullable)findBaseBeanWithXMLViewType:(NSString * _Nonnull)viewType xmlDic:(NSDictionary * _Nonnull)xmlDic styleXml:(NSString * _Nullable)styleXml  observable:(id<SpringViewObservable> _Nullable)observaleObj{
    
    if([viewType isEqualToString:@"View"]){
        return [[SpringLayoutViewBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    else if([viewType isEqualToString:@"Label"]){
        return [[SpringLayoutLabelBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    else if([viewType isEqualToString:@"ImageView"]){
        return [[SpringLayoutImageViewBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    else if([viewType isEqualToString:@"Button"]){
        return [[SpringLayoutButtonBean alloc] initWithXMLDic:xmlDic styleXml:styleXml];
    }
    
    return nil;
}

+(void)setArrayForViewType{
    
    __viewTypeArray = [NSMutableArray new];
    [__viewTypeArray addObject:@"View"];
    [__viewTypeArray addObject:@"Label"];
    [__viewTypeArray addObject:@"ImageView"];
    [__viewTypeArray addObject:@"Button"];
}

+(NSMutableArray * _Nonnull)viewTypeArray{
    return __viewTypeArray;
}

@end
