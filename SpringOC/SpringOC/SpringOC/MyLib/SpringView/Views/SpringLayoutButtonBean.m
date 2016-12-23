//
//  SpringLayoutButtonBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutButtonBean.h"

@implementation SpringLayoutButtonBean

-(void)initialXMLProperty{
    [super initialXMLProperty];
    
    self.titleForNormal = [self propertyXMLWithName:@"titleForNormal"];
}

-(void)exeBeanPropertiesWithView:(id)view{
    [super exeBeanPropertiesWithView:view];
    
    UIButton *btn = view;
    
    if(self.titleForNormal){
        [btn setTitle:self.titleForNormal forState:UIControlStateNormal];
    }
}

-(id)createViewInstance{
    return [[UIButton alloc] init];
}

@end
