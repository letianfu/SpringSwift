//
//  LUViewBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutViewBean.h"
#import "Masonry.h"
#import "UIColor+SpringEx.h"
#import "SpringLayoutOffsetValue.h"
#import "SpringLayoutViewBean.h"

@implementation SpringLayoutViewBean

-(void)initialXMLProperty{
    [super initialXMLProperty];
    
    self.backgroundColor = [super propertyXMLWithName:@"backgroundColor"];
    
}

-(void)addSubViewForSuperView:(UIView *_Nonnull)superView{
    
    UIView *view = [self createViewInstance];
    [superView addSubview:view];
    
    typeof(self) __weak weakself = self;
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if(weakself.width){
            make.width.mas_equalTo([NSNumber numberWithFloat:weakself.width.floatValue]);
        }
        
        if(weakself.height){
            make.height.mas_equalTo([NSNumber numberWithFloat:weakself.height.floatValue]);
        }
        
        if([weakself.centerInSuper boolValue]){
            make.center.equalTo(superView);
        }
        
        if(weakself.offsetTo){
            
            SpringLayoutOffsetValue *value = [[SpringLayoutOffsetValue alloc] initWithJSON:self.offsetTo];
            
            if(value.left){
                
                if([value.left.indexId isEqualToString:@"super"]){
                    make.left.equalTo(superView.mas_left).with.offset(value.left.equal);
                }
                
                if([value.top.indexId isEqualToString:@"super"]){
                    make.top.equalTo(superView.mas_top).with.offset(value.top.equal);
                }
                
                if([value.right.indexId isEqualToString:@"super"]){
                    make.right.equalTo(superView.mas_right).with.offset(value.right.equal);
                }
                
                if([value.bottom.indexId isEqualToString:@"super"]){
                    make.bottom.equalTo(superView.mas_bottom).with.offset(value.bottom.equal);
                }
                
            }
        }
    }];
    
    [self exeBeanPropertiesWithView:view];
    
    [self addSubViewsForSuperView:view];
}

-(void)exeBeanPropertiesWithView:(id)view{
    
    UIView *myView = view;
    if(self.backgroundColor){
        myView.backgroundColor = [UIColor sp_rgb:self.backgroundColor];
    }
}

@end
