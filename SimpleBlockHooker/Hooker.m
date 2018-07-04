//
//  Hooker.m
//  SimpleBlockHooker
//
//  Created by Shilei Zhang on 2018/7/4.
//  Copyright © 2018年 Shilei Zhang. All rights reserved.
//

#import "Hooker.h"

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0 *Desc;
};

static void __main_block_func_0(struct __main_block_impl_0 *__cself){
    NSLog(@"Hello,world!");
}

static void __main_block_func_args(struct __main_block_impl_0 *__cself, NSInteger a, NSString *str){
    NSLog(@"%ld,%@ block invoked.",(long)a,str);
}

@implementation Hooker

+(void)hookBlockToPrintHelloWorld:(id)block{
    struct __main_block_impl_0 *ablock = (__bridge struct __main_block_impl_0 *)block;
    ablock->impl.FuncPtr = (void *)__main_block_func_0;
}


+(void)hookBlockToPrintArguments:(id)block{
    struct __main_block_impl_0 *ablock = (__bridge struct __main_block_impl_0 *)block;
    ablock->impl.FuncPtr = (void *)__main_block_func_args;
}

@end
