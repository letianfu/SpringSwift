//
//  LUViewBean.h
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LUViewBean : NSObject
    
@property(nullable,strong,nonatomic)NSString *indexId;

@property(nullable,strong,nonatomic)NSString *width;

@property(nullable,strong,nonatomic)NSString *height;

@property(nullable,strong,nonatomic)NSString *centerInSuper;

@property(nullable,strong,nonatomic)NSString *backgroundColor;

//边距，像素
@property(nullable,strong,nonatomic)NSString *offsetTo;

//indexId - bean
@property(nullable,strong,nonatomic)NSMutableDictionary<NSString *,LUViewBean *> *subViewBeanMapper;
    
-(id _Nonnull)initWithXMLDoc:(NSDictionary * _Nonnull)xmlDic;

-(UIView *_Nonnull)readViewForSuperView:(UIView *_Nonnull)superView;

@end
