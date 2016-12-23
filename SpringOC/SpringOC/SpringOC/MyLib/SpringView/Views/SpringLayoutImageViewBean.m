//
//  SpringLayoutImageViewBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutImageViewBean.h"

@implementation SpringLayoutImageViewBean

-(instancetype)initWithXMLDic:(NSDictionary *)xmlDic{
    self = [super initWithXMLDic:xmlDic];
    
    if(self){
        self.src = self.xmlDic[@"_src"];
    }
    
    return self;
}

-(void)exeBeanPropertiesWithView:(id)view{
    UIImageView *imageView = view;
    
    if(self.src){
        imageView.image = [UIImage imageNamed:self.src];
    }
}

-(id)createViewInstance{
    return [[UIImageView alloc] init];
}

@end
