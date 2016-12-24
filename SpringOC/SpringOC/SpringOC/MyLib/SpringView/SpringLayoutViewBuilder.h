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
#import "SpringViewObservable.h"

@interface SpringLayoutViewBuilder : NSObject

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName style:(NSString * _Nullable)styleXMLName superView:(UIView *_Nonnull)superView;

+(void)buildXMLViewFrom:(NSString * _Nonnull)xmlName style:(NSString * _Nullable)styleXMLName superView:(UIView *_Nonnull)superView observable:(id<SpringViewObservable> _Nullable)observaleObj;

+(SpringLayoutBaseBean * _Nullable)findBaseBeanWithXMLViewType:(NSString * _Nonnull)viewType xmlDic:(NSDictionary * _Nonnull)xmlDic styleXml:(NSString * _Nullable)styleXml  observable:(id<SpringViewObservable> _Nullable)observaleObj;

+(NSMutableArray * _Nonnull)viewTypeArray;

@end
