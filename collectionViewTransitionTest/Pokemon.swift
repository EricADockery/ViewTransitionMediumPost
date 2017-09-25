//
//  Pokemon.swift
//  collectionViewTransitionTest
//
//  Created by Eric Dockery on 9/25/17.
//  Copyright © 2017 Eric Dockery. All rights reserved.
//

import UIKit

class Pokemon {

    var pokemonName: String
    var pokemonDetails: String
    var pokemonImage: String

    init(name: String, details: String, image: String) {
        pokemonName = name
        pokemonDetails = details
        pokemonImage = image
    }
}
