//
//  DTViewController.m
//  DTCubeView
//
//  Created by Darktt on 13/3/28.
//  Copyright (c) 2013 Darktt. All rights reserved.
//

#import "DTViewController.h"
#import "DTCubeView.h"

#define rgb(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface DTViewController () {
    UIView *view1;
    UIView *view2;
    UIView *view3;
}

@end

@implementation DTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [view1 setBackgroundColor:rgb(214, 36, 8)];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [view2 setBackgroundColor:rgb(0, 215, 8)];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [view3 setBackgroundColor:rgb(22, 69, 174)];
    
    DTCubeView *cubeView = [DTCubeView cubeViewWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 44) forView1:view1 andView2:view2];
    [cubeView setTag:1];
    
    [self.view addSubview:cubeView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 0, 73, 37)];
    [btn setCenter:self.view.center];
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(slideCubeUP:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)dealloc
{
    [view1 release];
    [view2 release];
    [view3 release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slideCubeUP:(id)sender
{
    DTCubeView *cubeView = (DTCubeView *)[self.view viewWithTag:1];
    [cubeView slideUP];
    
    UIButton *btn = (UIButton *)sender;
    [btn removeTarget:self action:@selector(slideCubeUP:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(slideCubeDown:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)slideCubeDown:(id)sender
{
    DTCubeView *cubeView = (DTCubeView *)[self.view viewWithTag:1];
    
    [cubeView setView1:view3];
    [cubeView slideDown];
    
    UIButton *btn = (UIButton *)sender;
    [btn removeTarget:self action:@selector(slideCubeDown:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(slideCubeUP:) forControlEvents:UIControlEventTouchUpInside];
}

@end
