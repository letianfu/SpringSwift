//
//  NSObject+SpringEx.h
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SpringEx)

//runtime 获取所有属性
+(NSArray<NSString *> * _Nonnull)sp_allProperties;

@end
