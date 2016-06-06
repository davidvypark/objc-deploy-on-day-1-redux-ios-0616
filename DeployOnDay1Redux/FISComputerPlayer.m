//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled {
    
    return YES;
}

//-(FISTicTacToePosition)nextPlay {                       //random play
//    
//    NSUInteger row = arc4random_uniform(3);
//    NSUInteger column = arc4random_uniform(3);
//    
//    if ([self.game canPlayAtColumn:column row:row]) {
//        return FISTicTacToePositionMake(column, row);
//    }
//    
//    [self nextPlay];
//
//
//}



-(FISTicTacToePosition)nextPlay {                          //smart play

    NSArray *board = self.game.board;

    NSUInteger column = arc4random_uniform(3);
    NSUInteger row = arc4random_uniform(3);
    NSUInteger occurances = 0;
    
    while(![board[column][row] isEqualToString:@""]){
        column = arc4random_uniform(3);
        row = arc4random_uniform(3);
    }
    
    NSString *compSymbol = @"X";
    NSArray *flatArray = [board valueForKeyPath:@"@unionOfArrays.self"];

    for(NSString *string in flatArray){
        occurances += ([string isEqualToString:@""]?1:0);
    }
    
    if (occurances % 2 == 0){
        compSymbol = @"O";
    }
    
    for(NSUInteger a = 0; a < 3; a++) {
        if (board[a][0] == board[a][1] && ![board[a][0] isEqualToString:@""]) {
            if([board[a][2] isEqualToString:@""]) {
                column = a;
                row = 2;
                
                if(board[a][0] == compSymbol) {
                    return FISTicTacToePositionMake(column, row);
                }
            }
        } else if (board[a][1] == board[a][2] && ![board[a][1] isEqualToString:@""]) {
            if([board[a][0] isEqualToString:@""]) {
                column = a;
                row = 0;
                
                if(board[a][1] == compSymbol) {
                    return FISTicTacToePositionMake(column, row);
                }
            }
        } else if (board[a][0] == board[a][2] && ![board[a][0] isEqualToString:@""]) {
            if([board[a][1] isEqualToString: @""]) {
                column = a;
                row = 1;
                
                if(board[a][0] == compSymbol) {
                    return FISTicTacToePositionMake(column, row);
                }
            }
        } else if (board[0][a] == board [1][a] && ![board[0][a] isEqualToString: @""]) {
            if ([board[2][a] isEqualToString:@""]) {
                column = 2;
                row = a;
                
                if(board[0][a] == compSymbol) {
                    return FISTicTacToePositionMake(column, row);
                }
            }
        } else if (board[1][a] == board[2][a] && ![board[1][a] isEqualToString: @""]) {
            if ([board[0][a] isEqualToString:@""]) {
                column = 0;
                row = a;
                
                if(board[1][a] == compSymbol) {
                    return FISTicTacToePositionMake(column, row);
                }
            }
        } else if (board[0][a] == board[2][a] && ![board[0][a] isEqualToString:@""]) {
            if ([board[1][a] isEqualToString:@""]) {
                column = 1;
                row = a;
                
                if(board[0][a] == compSymbol) {
                    return FISTicTacToePositionMake(column, row);
                }
            }
        }
    }
    
    NSArray *topLeft = @[board[0][0],board[1][1],board[2][2]];
    NSArray *bottomLeft = @[board[2][0],board[1][1],board[0][2]];
    
    if ((topLeft[0] == topLeft[1] && ![topLeft[0] isEqualToString:@""]) ||(topLeft[1] == topLeft[2] && ![topLeft[1] isEqualToString:@""]) || (topLeft[0] == topLeft[2] && ![topLeft[0] isEqualToString:@""])) {
        if([topLeft containsObject:@""]) {
            NSUInteger topLeftIndex = [topLeft indexOfObject:@""];
        
            column = topLeftIndex;
            row = topLeftIndex;
        }
    }
    
        
    if ((bottomLeft[0] == bottomLeft[1] && ![bottomLeft[0] isEqualToString:@""]) ||(bottomLeft[1] == bottomLeft[2] && ![bottomLeft[1] isEqualToString:@""]) || (bottomLeft[0] == bottomLeft[2] && ![bottomLeft[0] isEqualToString:@""])) {
        if([bottomLeft containsObject:@""]) {
            NSUInteger bottomLeftIndex = [topLeft indexOfObject:@""];
            
            if (bottomLeftIndex == 1) {
                column = 2;
                row = 0;
            } else if (bottomLeftIndex == 2) {
                column = 1;
                row = 1;
            } else {
                column = 0;
                row = 2;
            }
        }
        
    }
    
    
    
    
        return FISTicTacToePositionMake(column, row);
}






@end
