//
//  TLCPokemonController.h
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLCPokemon;



@interface TLCPokemonController : NSObject

-(void)getAllPokemon: (void (^)(NSError *error))completion;

-(void)getPokemonDetails:(TLCPokemon *)pokemon;

-(NSArray <TLCPokemon *> *)pokemonArray;

@end


