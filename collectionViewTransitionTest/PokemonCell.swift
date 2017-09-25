//
//  PokemonCell.swift
//  collectionViewTransitionTest
//
//  Created by Eric Dockery on 9/25/17.
//  Copyright © 2017 Eric Dockery. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!

    func updateWithImage(image: UIImage?) {
        if let imageToDisplay = image {
            pokemonImage.image = imageToDisplay
        } else {
            pokemonImage.image = nil
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(image: nil)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        updateWithImage(image: nil)
    }

}
