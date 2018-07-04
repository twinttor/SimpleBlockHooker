//
//  Hooker.h
//  SimpleBlockHooker
//
//  Created by Shilei Zhang on 2018/7/4.
//  Copyright © 2018年 Shilei Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hooker : NSObject

+(void)hookBlockToPrintHelloWorld:(id)block;

+(void)hookBlockToPrintArguments:(id)block;

@end
