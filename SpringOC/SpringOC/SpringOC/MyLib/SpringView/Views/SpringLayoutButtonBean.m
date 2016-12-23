//
//  SpringLayoutButtonBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutButtonBean.h"
#import "UIColor+SpringEx.h"

@implementation SpringLayoutButtonBean

-(void)initialXMLProperty{
    [super initialXMLProperty];
    
    self.titleForNormal = [self propertyXMLWithName:@"titleForNormal"];
    self.titleColorForNormal = [self propertyXMLWithName:@"titleColorForNormal"];
}

-(void)exeBeanPropertiesWithView:(id)view{
    [super exeBeanPropertiesWithView:view];
    
    UIButton *btn = view;
    
    if(self.titleForNormal){
        [btn setTitle:self.titleForNormal forState:UIControlStateNormal];
    }
    
    if(self.titleColorForNormal){
        [btn setTitleColor:[UIColor sp_rgb:self.titleColorForNormal] forState:UIControlStateNormal];
    }
}

-(id)createViewInstance{
    return [[UIButton alloc] init];
}

@end
