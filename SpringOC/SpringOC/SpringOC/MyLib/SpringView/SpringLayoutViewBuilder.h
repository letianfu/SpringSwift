//
//  SpringLayoutViewBuilder.h
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SpringLayoutViewBean.h"

@interface SpringLayoutViewBuilder : NSObject

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName superView:(UIView *_Nonnull)superView;

+(SpringLayoutBaseBean * _Nullable)findBaseBeanWithXMLViewType:(NSString * _Nonnull)viewType xmlDic:(NSDictionary * _Nonnull)xmlDic;

+(NSMutableArray * _Nonnull)viewTypeArray;

@end
