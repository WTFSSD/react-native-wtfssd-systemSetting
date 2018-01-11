//
//  RCTSystemSetting.m
//  RCTSystemSetting
//
//  Created by WTFSSD on 2018/1/11.
//  Copyright © 2018年 wtfssd. All rights reserved.
//

#import "RCTSystemSetting.h"
#import <UIKit/UIKit.h>
#import <React/RCTUtils.h>
@implementation RCTSystemSetting
RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(openSystemSetting){
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ( [[UIApplication sharedApplication] canOpenURL: url] ) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:url];
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"警告" message:[NSString stringWithFormat:@"无法打开:%@",url] preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            UIViewController *root = RCTPresentedViewController();
            [root presentViewController:alert animated:YES completion:nil];
            
        });
        
    }
}


@end
