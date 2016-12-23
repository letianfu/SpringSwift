//
//  SpringLayoutImageViewBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutImageViewBean.h"

@implementation SpringLayoutImageViewBean

-(void)initialXMLProperty{
    [super initialXMLProperty];
    
    self.src = self.xmlDic[@"_src"];
}

-(void)exeBeanPropertiesWithView:(id)view{
    [super exeBeanPropertiesWithView:view];
    
    UIImageView *imageView = view;
    
    if(self.src){
        imageView.image = [UIImage imageNamed:self.src];
    }
}

-(id)createViewInstance{
    return [[UIImageView alloc] init];
}

@end
