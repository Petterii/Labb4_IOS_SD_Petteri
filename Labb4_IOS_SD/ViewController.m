//
//  ViewController.m
//  Labb4_IOS_SD
//
//  Created by lösen är 0000 on 2018-02-06.
//  Copyright © 2018 PT. All rights reserved.
//

#import "ViewController.h"
#import "PTStapelDiagram.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      PTStapelDiagram *osc = [[PTStapelDiagram alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [osc setBackgroundColor:[UIColor grayColor]];
    // [self.view addSubview:osc];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
