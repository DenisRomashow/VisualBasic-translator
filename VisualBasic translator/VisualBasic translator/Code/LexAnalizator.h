//
//  LexAnalizator.h
//  VisualBasic translator
//
//  Created by Денис Ромашов on 24.08.12.
//  Copyright (c) 2012 Денис Ромашов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LexAnalizator : NSObject
{
    NSInteger parsingPosition;
    NSInteger numberInClass;
    NSString *inputString;
    NSInteger lexFirstIndex, lexLastIndex;
    
    NSDictionary *zarzervSlovaDictionary;
    NSDictionary *razdeliteliDictionary;
    NSDictionary *operatoriDictionary;
    NSDictionary *znakiOperaziiDictionary;
}
-(id)initWithString:(NSString*)string;
-(NSInteger)nextLexema;
@end
