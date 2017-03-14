//
//  main.m
//  Swift_OC_混编
//
//  Created by caoxu on 2017/3/14.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Swift_OC_混编-Swift.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"%s",__func__);
        Swift * swift = [[Swift alloc]init];
        [swift test:@"旭宝爱吃鱼"];
    }
    return 0;
}
