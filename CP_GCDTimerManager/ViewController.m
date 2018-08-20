//
//  ViewController.m
//  CP_GCDTimerManager
//
//  Created by lk03 on 2017/9/6.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "ViewController.h"
#import "CP_GCDTimerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[CP_GCDTimerManager sharedInstance] scheduledDispatchTimerWithName:@"chenp" timeInterval:1.0 queue:nil repeats:YES actionOption:ActionOption_AbandonPrevious action:^{
        static int i = 0;
        NSLog(@"i : %d",i);
        i++;
        if (i > 5) {
            [[CP_GCDTimerManager sharedInstance] cancelTimerWithName:@"chenp"];
        }
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%d",[[CP_GCDTimerManager sharedInstance] existTimer:@"chenp"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
