//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()



@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];                     //WTF do i do here?
    if(self) {
        [self resetBoard];
    }

    return self;
}

-(void)resetBoard{
    self.board = [@[
                    
                    [@[@"",@"",@""] mutableCopy],
                    [@[@"",@"",@""] mutableCopy],
                    [@[@"",@"",@""] mutableCopy]
                    
                    ] mutableCopy];
    
    NSLog(@"resetBoard");
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row{
    
    if ([self.board[column][row] isEqualToString:@"X"]) {
        return @"X";
    } else if ([self.board[column][row] isEqualToString:@"O"]){
        return @"O";
    } else{
    
    return @"";
    }
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self.board[column][row] isEqualToString: @""]) {
        return YES;
    } else {
        return NO;
    }
    
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row {
    
    self.board[column][row] = @"X";
    
    

}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row {
    
    self.board[column][row] = @"O";
    

}

-(NSString *)winningPlayer {

    for(NSUInteger a = 0; a < 3; a++) {
        if (self.board[a][0] == self.board[a][1] && self.board[a][1] == self.board[a][2]) {
            return self.board[a][0];
        } else if (self.board[0][a] == self.board[1][a] && self.board[1][a] == self.board[2][a]) {
            return self.board[0][a];
        }
        if (self.board[0][0] == self.board[1][1] && self.board[1][1] == self.board[2][2]) {
            return self.board[0][0];
        }
        if (self.board[0][2] == self.board[1][1] && self.board[1][1] == self.board[2][0]) {
            return self.board[0][2];
        }
    }
    
    return @"";
}

-(BOOL)isADraw {
    
    NSArray *flatArray = [self.board valueForKeyPath:@"@unionOfArrays.self"];
    
    if (![flatArray containsObject:@""]) {
        return YES;
    } else {
        return NO;
    }
}

@end
