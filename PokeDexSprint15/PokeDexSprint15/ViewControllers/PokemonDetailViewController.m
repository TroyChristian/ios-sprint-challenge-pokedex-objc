//
//  PokemonDetailViewController.m
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "PokemonDetailViewController.h"
#import "TLCPokemonController.h"
#import "TLCPokemon.h"

void *KVOContext = &KVOContext;

@interface PokemonDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImage;
@property (weak, nonatomic) IBOutlet UILabel *PokemonNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilitiesLabel;


@end

@implementation PokemonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pokemonController getPokemonDetails:self.pokemon];
    [self updateViews];
}

-(void)updateViews {
    if (self.pokemon) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.PokemonNameLabel.text = [NSString stringWithFormat:@"Name: %@",self.pokemon.name];
            self.pokemonImage.image = self.pokemon.pokemonSprite;
            self.idLabel.text = [NSString stringWithFormat: @"Name %@", self.pokemon.name];
            NSString *ability = [[self.pokemon.abilities valueForKey:@"description"] componentsJoinedByString:@", "];
            self.abilitiesLabel.text = [NSString stringWithFormat:@"Abilities: %@",  ability];
        });
    }
}
//set this viewcontroller to listen for a changed pokemon passed to it from the TBV
-(void) changePokemon:(TLCPokemon *)pokemon {
    [_pokemon removeObserver:self forKeyPath:@"abilities" context: KVOContext];
    [_pokemon removeObserver:self forKeyPath:@"pokemonId" context: KVOContext];
    [_pokemon removeObserver:self forKeyPath:@"pokemonSprite" context: KVOContext];
    
    _pokemon = pokemon;
    
    [_pokemon addObserver:self forKeyPath:@"abilities" options:NSKeyValueObservingOptionNew context:KVOContext];
    [_pokemon addObserver:self forKeyPath:@"pokemonId" options:NSKeyValueObservingOptionNew context:KVOContext];
    [_pokemon addObserver:self forKeyPath:@"pokemonSprite" options:NSKeyValueObservingOptionNew context:KVOContext];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == KVOContext) {
        if ([keyPath isEqualToString:@"abilities"]) {
            [self updateViews];
        } else if ([keyPath isEqualToString:@"pokemonId"]) {
            [self updateViews];
        } else if([keyPath isEqualToString:@"pokemonSprite"]) {
            [self updateViews];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)dealloc {
    self.pokemon = nil;
}


@end
