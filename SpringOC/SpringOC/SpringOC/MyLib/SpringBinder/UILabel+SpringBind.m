//
//  UILabel+SpringBind.m
//  SpringOC
//
//  Created by fuletian on 2016/12/13.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UILabel+SpringBind.h"

@implementation SpringBindLabelMapper

@end

@implementation UILabel (SpringBind)

+(SpringBindLabelMapper * _Nonnull)sp_mapper{
    return [SpringBindLabelMapper new];
}

-(void)sp_onValueChangeWithKeyPath:(NSString * _Nonnull)keyPath newValue:(id _Nullable)newValue{
    
    [super sp_onValueChangeWithKeyPath:keyPath newValue:newValue];
    
    NSString *viewProp = self.mapper.allKeyProperties[keyPath];
    if([viewProp isEqualToString:@"text"]){
        self.text = newValue;
    }
}

@end
