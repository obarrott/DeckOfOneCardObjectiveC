//
//  CardViewController.swift
//  DeckOfOneCardOBJC
//
//  Created by Owen Barrott on 9/29/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Properties
    var card: OBBCard?
    var image: UIImage?
    
    // MARK: - LifecycleMethods
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        OBBCardController.fetchCardCompletion { (card) in
            print("\(card.suit)")
            print("\(card.imagePath)")
            OBBCardController.fetchCardImage(for: card) { (image) in
                DispatchQueue.main.async {
                    self.card = card
                    self.image = image
                    self.updateViews()
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    func updateViews() {
        guard let card = card, let image = image else {return}
        suitLabel.text = card.suit
        cardImageView.image = image
    }
}

