//
//  SpringApplication.h
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpringProtocolMapper.h"

@interface SpringApplication : NSObject

+(void)installAppWithXML:(NSString * _Nonnull)xmlName;

+(SpringApplication * _Nonnull)shareApp;

+(SpringProtocolMapper * _Nonnull)shareProtocolMapper;

@end
