//
//  SpringLayoutViewBuilder.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutViewBuilder.h"
#import "XMLDictionary.h"

@implementation SpringLayoutViewBuilder

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName superView:(UIView *_Nonnull)superView{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:xmlName ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
    
    NSLog(@"%@",xmlDoc);
    
    NSString *rootType = xmlDoc[@"__name"];
    SpringLayoutBaseBean *viewBean = [[self class] findBaseBeanWithXMLViewType:rootType xmlDic:xmlDoc];
    [viewBean addSubViewForSuperView:superView];
}

+(SpringLayoutBaseBean * _Nullable)findBaseBeanWithXMLViewType:(NSString * _Nonnull)viewType xmlDic:(NSDictionary * _Nonnull)xmlDic{
    
    if([viewType isEqualToString:@"View"]){
        return [[SpringLayoutViewBean alloc] initWithXMLDic:xmlDic];
    }
    
    return nil;
}

@end
