//
//  ViewController.m
//  VisualBasic translator
//
//  Created by Денис Ромашов on 24.08.12.
//  Copyright (c) 2012 Денис Ромашов. All rights reserved.
//

#import "ViewController.h"
#import "Code/LexAnalizator.h"
@interface ViewController ()

@end
@implementation ViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        lexAnalizator = [[LexAnalizator alloc] initWithString:@"Module Module1 Sub Main() Dim num As Integer"];
    }
    return self;
}

-(IBAction)runner:(id)sender {
    NSInteger idLexemi;
    idLexemi =    [lexAnalizator nextLexema];
    NSLog(@"%i",idLexemi);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
