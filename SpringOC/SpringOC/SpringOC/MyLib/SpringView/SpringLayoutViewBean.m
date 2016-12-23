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
    
    self.indexId = self.xmlDic[@"_id"];
    self.width = self.xmlDic[@"_width"];
    self.height = self.xmlDic[@"_height"];
    self.centerInSuper = self.xmlDic[@"_centerInSuper"];
    self.backgroundColor = self.xmlDic[@"_backgroundColor"];
    self.offsetTo = self.xmlDic[@"_offsetTo"];
}

-(void)initSubViewBeans{
    
    self.subViewBeanMapper = [NSMutableDictionary new];
    
    NSDictionary *subXMLDic = self.xmlDic[@"View"];
    
    if([subXMLDic isKindOfClass:[NSDictionary class]]){
        
        SpringLayoutViewBean *bean = [[SpringLayoutViewBean alloc] initWithXMLDic:subXMLDic];
        
        NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
        [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
        
    }
    else if ([subXMLDic isKindOfClass:[NSArray class]]){
        
        for(NSDictionary *itemDic in subXMLDic){
            
            SpringLayoutViewBean *bean = [[SpringLayoutViewBean alloc] initWithXMLDic:itemDic];
            NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
            [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
        }
    }
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
    
    if(self.backgroundColor){
        view.backgroundColor = [UIColor sp_rgb:self.backgroundColor];
    }
    
    [self addSubViewsForSuperView:view];
}

@end
