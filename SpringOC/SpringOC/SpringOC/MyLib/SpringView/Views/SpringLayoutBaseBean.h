//
//  SpringLayoutBaseBean.h
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDictionary.h"
#import <UIKit/UIKit.h>
#import "SpringViewStyleClass.h"
#import "SpringViewObservable.h"

@interface SpringLayoutBaseBean : NSObject

@property(nonnull,nonatomic,strong)NSDictionary *xmlDic;

@property(nullable,strong,nonatomic)NSString *indexId;

@property(nullable,strong,nonatomic)NSString *styleId;

@property(nullable,strong,nonatomic)NSString *styleFilename;

//autolayout
@property(nullable,strong,nonatomic)NSString *width;

@property(nullable,strong,nonatomic)NSString *height;

@property(nullable,strong,nonatomic)NSString *centerInSuper;

@property(nullable,strong,nonatomic)NSString *offsetTo;     //边距，像素

//监听者
@property(nullable,weak,nonatomic)id<SpringViewObservable> observableObj;

//样式 indexId - bean
@property(nullable,strong,nonatomic)NSDictionary<NSString *,SpringViewStyleClass *> *classMapper;

//view indexId - bean
@property(nullable,strong,nonatomic)NSMutableDictionary<NSString *,SpringLayoutBaseBean *> *subViewBeanMapper;

-(instancetype _Nonnull)initWithXMLDic:(NSDictionary * _Nonnull)xmlDic styleXml:(NSString * _Nullable)styleXml;

//初始化xml属性值
-(void)initialXMLProperty;

//执行该bean指定的属性
-(void)exeBeanPropertiesWithView:(id _Nonnull)view;

//将该bean的属性生成view并添加至superView
-(void)addSubViewForSuperView:(UIView *_Nonnull)superView;

//添加所有子view
-(void)addSubViewsForSuperView:(UIView * _Nonnull)view;

//该bean对应view实例(默认：UIView)
-(id _Nonnull)createViewInstance;

//查找xml配置属性
-(NSString * _Nullable)propertyXMLWithName:(NSString *_Nonnull)name;

//自动注入该class的属性列表
-(void)autoLoadMappedProperties:(Class _Nonnull)clz;


@end
