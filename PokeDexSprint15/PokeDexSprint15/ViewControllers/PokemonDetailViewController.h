//
//  PokemonDetailViewController.h
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TLCPokemonController, TLCPokemon;

@interface PokemonDetailViewController : UIViewController
@property (nonatomic) TLCPokemonController *pokemonController;
@property(nonatomic) TLCPokemon *pokemon;

@end

