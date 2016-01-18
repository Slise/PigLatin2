//
//  NSString+PigLatin.m
//  PigLatin2
//
//  Created by Benson Huynh on 2016-01-17.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization {
    // take input from user and turn input into parsed words
    // iterate over input and look for white space
    
    NSArray *inputWords = [self componentsSeparatedByString:@" "];
    
    // store them into individual words and into a variable
    
    NSMutableArray *outputWords = [NSMutableArray new];
    
    /* pigLatinize each word:
          1. move first consontant(s) to end of word
              a) interate over word and remove constant(s) from word
              b) store consonant(s) into a variable and add to end of word
          2. add 'ay' to end of word */
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    for (NSString *word in inputWords) {
        NSRange range = [word rangeOfCharacterFromSet:vowelSet];
        if (range.location == 0) {
            NSString *outputWord = [NSString stringWithFormat:@"%@way", word];
            [outputWords addObject:outputWord];
        }
        else {
            NSUInteger beginningLength = range.location ;
            NSRange beginningRange = NSMakeRange(0, beginningLength);
            NSString *beginning = [word substringWithRange:beginningRange];
            
            NSUInteger endLength = word.length - range.location;
            NSRange endRange = NSMakeRange(range.location, endLength);
            NSString *end = [word substringWithRange:endRange];
            
            NSString *outputWord = [NSString stringWithFormat:@"%@%@ay", end, beginning];
            [outputWords addObject:outputWord];
        }
    }
    return [outputWords componentsJoinedByString:@" "];;
}

@end

