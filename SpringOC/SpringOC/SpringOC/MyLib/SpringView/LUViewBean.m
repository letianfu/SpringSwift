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
        
        self.subViewBeans = [NSMutableArray new];
        
        if([xmlDic isKindOfClass:[NSDictionary class]]){
            
            LUViewBean *bean = [[LUViewBean alloc] initWithXMLDoc:xmlDic];
            [self.subViewBeans addObject:bean];
            
        }
        else if ([xmlDic isKindOfClass:[NSArray class]]){
            
            for(NSDictionary *itemDic in xmlDic){
                
                LUViewBean *bean = [[LUViewBean alloc] initWithXMLDoc:itemDic];
                [self.subViewBeans addObject:bean];
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
    
    if(self.subViewBeans.count == 0 ){
        return;
    }
    
    for(LUViewBean *bean in self.subViewBeans){
        
        [bean readViewForSuperView:view];
    }
}

@end
