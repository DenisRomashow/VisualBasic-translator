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
        firstLoad = YES;
    }
    return self;
}
-(BOOL)loadCodeEditor {
    lexAnalizator = [[LexAnalizator alloc] initWithString:[codeEditorTextView text]];
    return NO;
}
-(IBAction)runner:(id)sender {
    if (!firstLoad) {
        NSInteger idLexemi;
        idLexemi = [lexAnalizator nextLexema];
        codeGeneratorTextView.text = [[NSNumber numberWithInteger:idLexemi] stringValue];
        
    }
    else {
        firstLoad = [self loadCodeEditor];
    }
    
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
