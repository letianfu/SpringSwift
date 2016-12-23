//
//  SpringViewStyleClass.h
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringViewStyleClass : NSObject

@property(nonatomic,nonnull,strong)NSString *fileName;
@property(nonnull,nonatomic,strong)NSString *indexId;

//view
@property(nullable,nonatomic,strong)NSString *backgroundColor;
@property(nullable,nonatomic,strong)NSString *borderColor;

//button
@property(nullable,nonatomic,strong)NSString *titleForNormal;

+(NSDictionary<NSString *,SpringViewStyleClass *> * _Nonnull)classArrayFromStyleDic:(NSDictionary * _Nonnull)styleDic filename:(NSString * _Nonnull)filename;

@end
