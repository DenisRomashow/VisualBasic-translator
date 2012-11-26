//
//  ViewController.h
//  VisualBasic translator
//
//  Created by Денис Ромашов on 24.08.12.
//  Copyright (c) 2012 Денис Ромашов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Code/LexAnalizator.h"
@interface ViewController : UIViewController
{
    LexAnalizator *lexAnalizator;
    IBOutlet UITextView *codeEditorTextView;
    IBOutlet UITextView *codeGeneratorTextView;
    BOOL firstLoad ;
    
}
-(IBAction)runner:(id)sender;
@end
