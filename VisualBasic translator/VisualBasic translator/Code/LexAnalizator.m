//
//  LexAnalizator.m
//  VisualBasic translator
//
//  Created by Денис Ромашов on 24.08.12.
//  Copyright (c) 2012 Денис Ромашов. All rights reserved.
//

#import "LexAnalizator.h"

@implementation LexAnalizator

-(id)initWithString:(NSString*)string
{
    self=[super init];
    if (self) {
        inputString = string;
        parsingPosition = 0;
        lexFirstIndex   = 0;
        lexLastIndex    = 0;
        [self loadDictionaries];
    }
    return self;
}
-(void)loadDictionaries {
    NSArray * resrvKeys=[NSArray arrayWithObjects:@"Module",@"Sub",@"Main",
                          @"Dim",@"As",@"Integer",@"Float",@"Double",@"If",
                          @"While",@"End",@"GoTo",@"Then", nil];
    NSMutableArray *reservWords = [NSMutableArray new];
    for (int i=31; i<44; i++) {
        [reservWords addObject:[NSNumber numberWithInt:i]];
    }
    zarzervSlovaDictionary =  [[NSDictionary alloc]initWithObjects:reservWords forKeys:resrvKeys];
    
    razdeliteliDictionary =   [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNumber numberWithInt:61],@"(",[NSNumber numberWithInt:62], @")",
                                    [NSNumber numberWithInt:63],@":",[NSNumber numberWithInt:64], @"/n", nil];
    operatoriDictionary   =   [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNumber numberWithInt:71],@"+",
                                    [NSNumber numberWithInt:72],@"-", nil];
    znakiOperaziiDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNumber numberWithInt:81],@"<",[NSNumber numberWithInt:82],@">",
                                    [NSNumber numberWithInt:83],@"=", nil];
}

-(NSInteger)nextLexema {
    NSString *parsingResult =@"";
    BOOL access = YES;
    
    const char *cstring = [inputString UTF8String];
    char cstring2[0];
    
    for (; parsingPosition <[inputString length] && access; parsingPosition++) {
            cstring2[0] = cstring[parsingPosition];
        if (cstring2[0] == ' ' || cstring2[0] == ':'|| cstring2[0] == '('|| cstring2[0] == ')') {
            access=NO;
            lexLastIndex = parsingPosition;
            parsingResult = [inputString substringWithRange:NSMakeRange(lexFirstIndex,lexLastIndex - lexFirstIndex)];
            NSLog(@" 1stIndex: %d, 2ndIndex: %d, current Position: %d",lexFirstIndex,lexLastIndex,parsingPosition);
            parsingPosition++;
            lexFirstIndex = parsingPosition;

        }
    }
    
    NSLog(@"%@",parsingResult);
    numberInClass = [self getLexemaNumber:parsingResult];
    
    return numberInClass;
}

-(NSInteger)getLexemaNumber:(NSString*) currentLexema {
    
    NSNumber *literalNumber = [NSNumber new];
    
    literalNumber = [zarzervSlovaDictionary objectForKey: currentLexema] ;
    if (literalNumber==nil) {
        literalNumber = [razdeliteliDictionary objectForKey: currentLexema];
    }
     if (literalNumber==nil) {
        literalNumber = [operatoriDictionary objectForKey: currentLexema];
    }
     if (literalNumber==nil) {
        literalNumber = [znakiOperaziiDictionary objectForKey: currentLexema];
    }
     if (literalNumber==nil) {
        literalNumber = [NSNumber numberWithInteger:45];
    }
    return [literalNumber integerValue];
}

@end
