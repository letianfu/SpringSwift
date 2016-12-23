//
//  SpringViewStyleReader.h
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpringViewStyleClass.h"

@interface SpringViewStyleReader : NSObject

+(NSDictionary<NSString *,SpringViewStyleClass *> * _Nonnull)readStyleFromXMLName:(NSString * _Nonnull)xmlName;

@end
