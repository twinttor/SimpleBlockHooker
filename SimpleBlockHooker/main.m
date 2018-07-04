//
//  main.m
//  SimpleBlockHooker
//
//  Created by Shilei Zhang on 2018/7/4.
//  Copyright © 2018年 Shilei Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hooker.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        void(^nonargsBlock)(void) = ^{
            NSLog(@"这是一个不带参数的block.");
        };
        [Hooker hookBlockToPrintHelloWorld:nonargsBlock];
        nonargsBlock();
        
        void(^argsBlock)(NSInteger, NSString *) = ^(NSInteger a,NSString *str){
            NSLog(@"这是一个带参数的block");
        };
        [Hooker hookBlockToPrintArguments:argsBlock];
        argsBlock(10,@"I miss you!");
    }
    return 0;
}
