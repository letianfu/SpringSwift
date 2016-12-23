//
//  SpringLayoutLabelBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutLabelBean.h"
#import "NSObject+SpringEx.h"

@implementation SpringLayoutLabelBean

-(void)initialXMLProperty{
    [super initialXMLProperty];
    
    NSArray *allKeys = [[self class] sp_allProperties];
    for(NSString *key in allKeys){
        NSString *_key = [NSString stringWithFormat:@"_%@",key];
        self.text = self.xmlDic[_key];
    }
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
