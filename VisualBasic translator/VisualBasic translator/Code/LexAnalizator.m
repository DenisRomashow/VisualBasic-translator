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
        lexema = string;
        parsingPosition=0;
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
    zarzervSlovaDictionary = [[NSDictionary alloc]initWithObjects:reservWords forKeys:resrvKeys];
    
    razdeliteliDictionary =   [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNumber numberWithInt:61],@"(",[NSNumber numberWithInt:62], @")",
                                    [NSNumber numberWithInt:63],@":",[NSNumber numberWithInt:64], @"/n", nil];
    operatoriDictionary =     [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNumber numberWithInt:71],@"+",
                                    [NSNumber numberWithInt:72],@"-", nil];
    znakiOperaziiDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNumber numberWithInt:81],@"<",[NSNumber numberWithInt:82],@">",
                                    [NSNumber numberWithInt:83],@"=", nil];
}

-(NSInteger)nextLexema {
    NSString *tempString =  @"";
    BOOL access = YES;
    
    const char *cstring = [lexema UTF8String];
    
    for (; parsingPosition <[lexema length] && access; parsingPosition++) {
        
        
        if (cstring[parsingPosition] == ' '&& cstring[parsingPosition] ==  ':' ) {
            access=NO;
            parsingPosition++;
        }
        // тут беда... нужно копировать по символьно, с индексом дружить не хочет
        [tempString stringByAppendingString:[NSString stringWithUTF8String:[cstring[parsingPosition]]]];
        
        /*
        NSRange range = NSMakeRange(currentPosition,1);
        accessString =[lexema substringWithRange:range];
        if ([accessString isEqualToString:@" "]) {
            access=NO;
            tempString = [lexema substringToIndex:currentPosition];
            NSLog(@"%@",tempString);
            currentPosition++;
        }*/
    }
    numberInClass = [self getLexemaNumber:tempString];
    tempString = @"";
    
    return numberInClass;
}

-(NSInteger)getLexemaNumber:(NSString*) currentLexema {
    NSInteger literalNumber = 45;
    literalNumber = [[zarzervSlovaDictionary objectForKey: currentLexema] integerValue];
    NSLog(@"%d",literalNumber);
    return literalNumber;
}

@end
