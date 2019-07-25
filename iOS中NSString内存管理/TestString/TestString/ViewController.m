//
//  ViewController.m
//  TestString
//
//  Created by hui hong on 2019/7/25.
//  Copyright © 2019 hfighter. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

__weak Person *globalP = nil;
__weak NSString *gstr1 = nil;
__weak NSString *gstr2 = nil;
__weak NSString *gstr3 = nil;
__weak NSString *gstr4 = nil;
__weak NSString *gstr5 = nil;

__weak NSString *gstr11 = nil;
__weak NSString *gstr22 = nil;
__weak NSString *gstr33 = nil;
__weak NSString *gstr44 = nil;
__weak NSString *gstr55 = nil;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);

    NSString *str1 = @"hello";
    NSString *str11 = @"0123456789";
    NSString *str2 = [NSString stringWithFormat:@"%@", str1];
    NSString *str22 = [NSString stringWithFormat:@"%@", str11];
    NSString *str3 = [NSString stringWithString:str1];
    NSString *str33 = [NSString stringWithString:str11];
    NSString *str4 = [[NSString alloc] initWithString:str1];
    NSString *str44 = [[NSString alloc] initWithString:str11];
    NSString *str5 = [[NSString alloc] initWithFormat:@"%@", str1];
    NSString *str55 = [[NSString alloc] initWithFormat:@"%@", str11];
    Person *p = [Person new];
    
    NSLog(@"str1 = %@ - %@ - %p", str1, str1.class, str1);
    NSLog(@"str11 = %@ - %@ - %p", str11, str11.class, str11);
    NSLog(@"str2 = %@ - %@ - %p", str2, str2.class, str2);
    NSLog(@"str22 = %@ - %@ - %p", str22, str22.class, str22);
    NSLog(@"str3 = %@ - %@ - %p", str3, str3.class, str3);
    NSLog(@"str33 = %@ - %@ - %p", str33, str33.class, str33);
    NSLog(@"str4 = %@ - %@ - %p", str4, str4.class, str4);
    NSLog(@"str44 = %@ - %@ - %p", str44, str44.class, str44);
    NSLog(@"str5 = %@ - %@ - %p", str5, str5.class, str5);
    NSLog(@"str55 = %@ - %@ - %p", str55, str55.class, str55);
    NSLog(@"p = %@ - %@ - %p", p, p.class, p);
    
    gstr1 = str1;
    gstr11 = str11;
    gstr2 = str2;
    gstr22 = str22;
    gstr3 = str3;
    gstr33 = str33;
    gstr4 = str4;
    gstr44 = str44;
    gstr5 = str5;
    gstr55 = str55;
    globalP = p;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
    [self print];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
    [self print];
}

- (void)print {
    NSLog(@"gstr1 = %@ - %@ - %p", gstr1, gstr1.class, gstr1);
    NSLog(@"gstr11 = %@ - %@ - %p", gstr11, gstr11.class, gstr11);
    NSLog(@"gstr2 = %@ - %@ - %p", gstr2, gstr2.class, gstr2);
    NSLog(@"gstr22 = %@ - %@ - %p", gstr22, gstr22.class, gstr22);
    NSLog(@"gstr3 = %@ - %@ - %p",gstr3, gstr3.class, gstr3);
    NSLog(@"gstr33 = %@ - %@ - %p", gstr33, gstr33.class, gstr33);
    NSLog(@"gstr4 = %@ - %@ - %p", gstr4, gstr4.class, gstr4);
    NSLog(@"gstr44 = %@ - %@ - %p", gstr44, gstr44.class, gstr44);
    NSLog(@"gstr5 = %@ - %@ - %p", gstr5, gstr5.class, gstr5);
    NSLog(@"gstr55 = %@ - %@ - %p", gstr55, gstr55.class, gstr55);
    NSLog(@"globalp = %@ - %@ - %p", globalP, globalP.class, globalP);
}

@end
