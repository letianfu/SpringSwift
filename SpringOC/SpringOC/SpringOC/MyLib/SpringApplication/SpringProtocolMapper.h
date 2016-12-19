//
//  SpringProtocolMapper.h
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpringProtocolMapper : NSObject

-(id)initWithXML:(NSString *)xml;

-(id _Nonnull)createInstanceWithProtocol:(NSString * _Nonnull)protocolName;

@end
