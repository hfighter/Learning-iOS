//
//  NSString+HookDealloc.m
//  TestString
//
//  Created by hui hong on 2019/7/25.
//  Copyright © 2019 hfighter. All rights reserved.
//

#import "NSString+HookDealloc.h"
#import <objc/runtime.h>

@implementation NSString (HookDealloc)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method origialMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
//        Method swizzeMethod = class_getInstanceMethod([self class], @selector(hf_dealloc));
//        method_exchangeImplementations(origialMethod, swizzeMethod);
//    });
//}

- (void)hf_dealloc {
//    NSLog(@"hf_dealloc: %@ -- %@ -- %p", self, self.class, self);
//    [self hf_dealloc];
}

@end
