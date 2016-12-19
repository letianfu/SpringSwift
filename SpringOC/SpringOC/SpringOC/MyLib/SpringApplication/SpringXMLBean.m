//
//  SpringXMLBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringXMLBean.h"

@implementation SpringXMLModule

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"_id",
             @"protocolName" : @"_protocol",
             @"beanName" : @"__text"};
}

@end

@implementation SpringXMLBean

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"modules" : @"modules.item"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"modules" : [SpringXMLModule class]};
}

@end
