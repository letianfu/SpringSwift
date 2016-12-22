//
//  SpringLayoutController.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutController.h"
#import "LUViewBean.h"
#import "XMLDictionary.h"
#import <UIKit/UIKit.h>

@interface SpringLayoutController ()

@end

@implementation SpringLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)readViewXML:(NSString * _Nonnull)viewXML{
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)addViewFromXML:(NSString * _Nonnull)xmlName{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:xmlName ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
    
    NSLog(@"%@",xmlDoc);
    
    NSString *rootType = xmlDoc[@"__name"];
    if([rootType isEqualToString:@"View"]){
        LUViewBean *viewBean = [[LUViewBean alloc] initWithXMLDoc:xmlDoc];
        
        [viewBean readViewForSuperView:self.view];
    }
}

@end
