//
//  LUOffsetValue.h
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUOffsetSlideValue : NSObject

@property(nonatomic,nullable,strong)NSString *indexId;
@property(nonatomic,assign)float equal;

@end

@interface LUOffsetValue : NSObject

@property(nonatomic,nullable,strong)LUOffsetSlideValue *left;
@property(nonatomic,nullable,strong)LUOffsetSlideValue *top;
@property(nonatomic,nullable,strong)LUOffsetSlideValue *right;
@property(nonatomic,nullable,strong)LUOffsetSlideValue *bottom;

-(id _Nonnull)initWithJSON:(NSString *_Nonnull)json;

@end
