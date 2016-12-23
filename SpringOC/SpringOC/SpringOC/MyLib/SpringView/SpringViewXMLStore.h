//
//  SpringViewXMLStore.h
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 *xml数据保存
 */
@interface SpringViewXMLStore : NSObject

+(NSDictionary * _Nonnull)xmlDicFor:(NSString * _Nonnull)xmlName;

@end
