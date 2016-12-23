//
//  SpringLayoutLabelBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutLabelBean.h"

@implementation SpringLayoutLabelBean

-(void)initialXMLProperty{
    [super initialXMLProperty];
    
    self.text = self.xmlDic[@"_text"];
}

-(void)exeBeanPropertiesWithView:(id)view{
    [super exeBeanPropertiesWithView:view];
    
    UILabel *label = view;
    
    label.text = self.text;
}

-(id)createViewInstance{
    return [[UILabel alloc] init];
}

@end
