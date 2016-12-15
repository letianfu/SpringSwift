//
//  SpringLogger.h
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SP_PRINT_E(text)            [SpringLogger print:text];

@interface SpringLogger : NSObject

+(void)print:(NSString * _Nullable)text;

+(void)print_e:(NSString * _Nullable)text;

@end
