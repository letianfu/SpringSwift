//
//  SpringLayoutViewBuilder.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutViewBuilder.h"
#import "XMLDictionary.h"
#import "SpringLayoutViewBean.h"

@implementation SpringLayoutViewBuilder

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName superView:(UIView *_Nonnull)superView{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:xmlName ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
    
    NSLog(@"%@",xmlDoc);
    
    NSString *rootType = xmlDoc[@"__name"];
    if([rootType isEqualToString:@"View"]){
        SpringLayoutViewBean *viewBean = [[SpringLayoutViewBean alloc] initWithXMLDoc:xmlDoc];
        
        [viewBean readViewForSuperView:superView];
    }
}

@end
