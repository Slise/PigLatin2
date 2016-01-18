//
//  main.m
//  PigLatin2
//
//  Created by Benson Huynh on 2016-01-17.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Enter a phrase to be converted to piglatin: ");
        char str[100];
        fgets (str, 100, stdin);
        
        NSString *input = [[NSString alloc] initWithUTF8String:str];
        input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *output = [input stringByPigLatinization];
        
        NSLog(@"%@!", output);
    }
    return 0;
}
