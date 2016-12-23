//
//  UIViewController+SpringLayoutBind.m
//  SpringOC
//
//  Created by fuletian on 2016/12/23.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UIViewController+SpringLayoutBind.h"
#import "SpringLayoutViewBuilder.h"

@implementation UIViewController (SpringLayoutBind)

-(void)spl_addSubviewFrom:(NSString * _Nonnull)xmlName{
    
    [SpringLayoutViewBuilder buildXMLViewFrom:xmlName style:nil superView:self.view];
}

-(void)spl_addSubviewFrom:(NSString * _Nonnull)xmlName style:(NSString * _Nullable)styleXmlName{
    
    [SpringLayoutViewBuilder buildXMLViewFrom:xmlName style:styleXmlName superView:self.view];
}

@end
