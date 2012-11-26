//
//  LL1TableRow.h
//  VisualBasic translator
//
//  Created by Денис Ромашов on 29.08.12.
//  Copyright (c) 2012 Денис Ромашов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LL1TableRow : NSObject {
    NSArray *terminls;
    NSInteger jumpTo;
    BOOL needTake;
    BOOL needPush;
    BOOL needPop;
    BOOL isError;
}

@end
