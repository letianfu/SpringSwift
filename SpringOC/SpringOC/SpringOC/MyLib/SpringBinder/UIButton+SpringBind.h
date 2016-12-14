//
//  UIButton+SpringBind.h
//  SpringOC
//
//  Created by fuletian on 2016/12/14.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SpringBind.h"

@interface SpringBindButtonMapper : SpringBindViewMapper

@property(nonatomic,strong,nonnull)NSString *onClickCall;

@end

@interface UIButton (SpringBind)

-(void)sp_bindMapper:(void(^ _Nonnull)(SpringBindButtonMapper * _Nonnull))makeMapper;

@end
