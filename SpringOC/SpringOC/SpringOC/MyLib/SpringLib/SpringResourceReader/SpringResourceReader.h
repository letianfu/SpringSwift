//
//  SpringResourceReader.h
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringResourceReader : NSObject

+(NSString * _Nullable)stringFromResource:(NSString * _Nonnull)name ofType:(NSString * _Nonnull)type;

@end
