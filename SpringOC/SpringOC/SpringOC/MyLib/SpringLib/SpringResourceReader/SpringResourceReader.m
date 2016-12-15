//
//  SpringResourceReader.m
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringResourceReader.h"
#import "SpringLogger.h"

@implementation SpringResourceReader

+(NSString * _Nullable)stringFromResource:(NSString * _Nonnull)name ofType:(NSString * _Nonnull)type{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    if(!path){
        
        [SpringLogger print_e:[NSString stringWithFormat:@"没有找到resource[%@]",name]];
        return nil;
    }
    
    NSError *err;
    NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    
    if(err){
        [SpringLogger print_e:err.localizedDescription];
        return nil;
    }
    
    return content;
}

@end
