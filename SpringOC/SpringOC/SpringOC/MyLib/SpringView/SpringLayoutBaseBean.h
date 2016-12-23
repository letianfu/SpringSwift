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

@interface SpringLayoutBaseBean : NSObject

@property(nonnull,nonatomic,strong)NSDictionary *xmlDic;

//indexId - bean
@property(nullable,strong,nonatomic)NSMutableDictionary<NSString *,SpringLayoutBaseBean *> *subViewBeanMapper;

-(instancetype _Nonnull)initWithXMLDic:(NSDictionary * _Nonnull)xmlDic;

//初始化xml属性值
-(void)initialXMLProperty;

//添加子view bean
-(void)initSubViewBeans;

//将该bean的属性生成view并添加至superView
-(void)addSubViewForSuperView:(UIView *_Nonnull)superView;

//该bean对应view实例(默认：UIView)
-(id _Nonnull)createViewInstance;

@end
