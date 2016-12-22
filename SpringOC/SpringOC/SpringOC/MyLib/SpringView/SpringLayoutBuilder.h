//
//  SpringLayoutBuilder.h
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpringLayoutBuilder : NSObject
    
    
+(UIView * _Nonnull)viewFromXML:(NSString * _Nonnull)xmlName;

@end
