//
//  ViewController.m
//  CCTools
//
//  Created by 车 on 2018/12/6.
//  Copyright © 2018 车. All rights reserved.
//

#import "ViewController.h"
#import "CCKeychainStore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", [CCKeychainStore getDeviceID]);
    [CCKeychainStore delete:@"com.cctools.test"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
