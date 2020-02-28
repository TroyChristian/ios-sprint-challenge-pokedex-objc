//
//  TLCPokemon.h
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



@interface TLCPokemon : NSObject
@property(nonatomic, copy, nonnull) NSString *name;
@property (nonatomic, copy, nonnull) NSURL *detailsURL;
@property (nonatomic, nonnull) NSMutableArray *abilities;
@property(nonatomic) int pokemonId;
@property(nonatomic, nonnull) UIImage *pokemonSprite;

-(instancetype _Nonnull) initWithDictionary:(nonnull NSDictionary *)dictionary;

-(void)pokemonDetailsWithDictionary:(nonnull NSDictionary *)dictionary;

@end


