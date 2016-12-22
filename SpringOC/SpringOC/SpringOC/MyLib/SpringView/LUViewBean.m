//
//  LUViewBean.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "LUViewBean.h"
#import "Masonry.h"
#import "UIColor+SpringEx.h"

@implementation LUViewBean

-(id)initWithXMLDoc:(NSDictionary * _Nonnull)xmlDic{
    self = [super init];
    
    if(self){
        self.indexId = xmlDic[@"_id"];
        self.width = xmlDic[@"_width"];
        self.height = xmlDic[@"_height"];
        self.centerInSuper = xmlDic[@"_centerInSuper"];
        self.backgroundColor = xmlDic[@"_backgroundColor"];
        
        [self initSubviews:xmlDic[@"View"]];
    }
    
    return self;
}
    
    -(void)initSubviews:(id)xmlDic{
        
        if(!xmlDic){
            return;
        }
        
        self.subViewBeanMapper = [NSMutableDictionary new];
        
        if([xmlDic isKindOfClass:[NSDictionary class]]){
            
            LUViewBean *bean = [[LUViewBean alloc] initWithXMLDoc:xmlDic];
            
            NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
            [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
            
        }
        else if ([xmlDic isKindOfClass:[NSArray class]]){
            
            for(NSDictionary *itemDic in xmlDic){
                
                LUViewBean *bean = [[LUViewBean alloc] initWithXMLDoc:itemDic];
                NSAssert(self.subViewBeanMapper[bean.indexId] == NULL, @"已存在id");
                [self.subViewBeanMapper setObject:bean forKey:bean.indexId];
            }
        }
    }

-(UIView *_Nonnull)readViewForSuperView:(UIView *_Nonnull)superView{
    
    UIView *view = [[UIView alloc] init];
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
    }];
    
    if(self.backgroundColor){
        view.backgroundColor = [UIColor sp_rgb:self.backgroundColor];
    }
    
    [self addSubViewsForSuperView:view];
    
    return view;
}

-(void)addSubViewsForSuperView:(UIView *)view{
    
    if(self.subViewBeanMapper.allKeys.count == 0 ){
        return;
    }
    
    
    NSArray *allKeys = self.subViewBeanMapper.allKeys;
    for(NSString *key in allKeys){
        LUViewBean *bean = self.subViewBeanMapper[key];
        [bean readViewForSuperView:view];
    }
}

@end
