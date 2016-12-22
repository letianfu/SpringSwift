//
//  SpringLayoutBuilder.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutBuilder.h"
#import "SpringResourceReader.h"
#import "XMLDictionary.h"
#import "LUViewBean.h"
#import "YYModel.h"
#import "LUViewBean.h"
#import "Masonry.h"

@interface SpringLayoutBuilder()
    

@end

@implementation SpringLayoutBuilder
    
    
+(UIView * _Nonnull)viewFromXML:(NSString * _Nonnull)xmlName{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:xmlName ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
    
    NSLog(@"%@",xmlDoc);
    
    NSString *rootType = xmlDoc[@"__name"];
    if([rootType isEqualToString:@"View"]){
        LUViewBean *viewBean = [[LUViewBean alloc] initWithXMLDoc:xmlDoc];
        NSLog(@"");
    }
    
    return nil;
}

@end
