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

@property(nonnull,nonatomic,strong)NSString *backgroundColor;
@property(nonnull,nonatomic,strong)NSString *borderColor;

+(NSDictionary<NSString *,SpringViewStyleClass *> * _Nonnull)classArrayFromStyleDic:(NSDictionary * _Nonnull)styleDic filename:(NSString * _Nonnull)filename;

@end
