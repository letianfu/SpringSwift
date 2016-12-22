//
//  LUOffsetValue.h
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUOffsetValue : NSObject

@property(nonatomic,nullable,strong)NSString *offsetToIndexId;
@property(nonatomic,nullable,strong)NSString *leftPx;
@property(nonatomic,nullable,strong)NSString *topPx;
@property(nonatomic,nullable,strong)NSString *rightPx;
@property(nonatomic,nullable,strong)NSString *bottomPx;

-(id _Nonnull)initWithJSON:(NSString *_Nonnull)json;

@end
