//
//  LUOffsetValue.h
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringLayoutSlideValue : NSObject

@property(nonatomic,nullable,strong)NSString *indexId;
@property(nonatomic,assign)float equal;

@end

@interface SpringLayoutOffsetValue : NSObject

@property(nonatomic,nullable,strong)SpringLayoutSlideValue *left;
@property(nonatomic,nullable,strong)SpringLayoutSlideValue *top;
@property(nonatomic,nullable,strong)SpringLayoutSlideValue *right;
@property(nonatomic,nullable,strong)SpringLayoutSlideValue *bottom;

-(id _Nonnull)initWithJSON:(NSString *_Nonnull)json;

@end
