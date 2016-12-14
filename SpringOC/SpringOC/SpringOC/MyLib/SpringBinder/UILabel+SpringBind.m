//
//  UILabel+SpringBind.m
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UILabel+SpringBind.h"

@implementation SpringBindLabelMapper

-(NSMutableDictionary *)sp_observerblePropertyList{
    NSMutableDictionary *results = [super sp_observerblePropertyList];
    
    if(self.text){
        [results setObject:@"text" forKey:self.text];
    }
    
    return results;
}

@end

@implementation UILabel (SpringBind)

+(SpringBindLabelMapper * _Nonnull)sp_mapper{
    return [SpringBindLabelMapper new];
}

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue{
    
    [super sp_onValueChangeWithKeyPath:keyPath newValue:newValue];
    
    NSString *viewProp = [self.mapper sp_observerblePropertyList][keyPath];
    if([viewProp isEqualToString:@"text"]){
        self.text = newValue;
    }
}

@end
