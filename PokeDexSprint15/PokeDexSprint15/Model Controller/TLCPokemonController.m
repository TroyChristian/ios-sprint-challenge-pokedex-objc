//
//  TLCPokemonController.m
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCPokemonController.h"
#import "PokeDexSprint15-Swift.h"

@interface TLCPokemonController()

@property (nonatomic) NSArray<TLCPokemon *> *pokemonArray; //

@end

@implementation TLCPokemonController

-(void)retrievePokemon:(void (^)(NSError *))completion {
    [APIController.shared retrievePokemonWithCompletion:^(NSArray<TLCPokemon *> *pokemon, NSError *error) {
        if(error) {
            completion(error);
            return;
        } else {
            self.pokemonArray = [[NSArray alloc] initWithArray: pokemon];
            completion(nil);
        }
        
    }];
}

-(void)getPokemonDetails:(TLCPokemon *)pokemon {
    [APIController.shared retrieveDetailsFor:pokemon];
    
}

-(NSArray <TLCPokemon *> *)getPokemon {
    return self.pokemonArray;
}


@end
