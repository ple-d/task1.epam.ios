//
//  DetailViewController.swift
//  task1.epam.ios
//
//  Created by XO on 13.06.2021.
//  Copyright © 2021 XO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var meatImageView: UIImageView!
    
    @IBOutlet weak var meatNameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UILabel!
    
    var meatObject: Item? {
        didSet {
            set()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func set() {
        loadViewIfNeeded()
        meatImageView.image = UIImage(named: meatObject!.imageName)
        meatImageView.layer.cornerRadius = meatImageView.frame.height/2
        meatImageView.clipsToBounds = true
        
        meatNameLabel.text = meatObject?.title
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "star.fill")
        let starString = NSMutableAttributedString(attachment: attachment)
        let starArray = Array(repeating: "", count: Int(meatObject!.myRating))
        let stringStars = NSMutableAttributedString(string: "Rating: ")
        for _ in starArray.enumerated() {
            stringStars.append(starString)
        }
        
        ratingLabel.attributedText = stringStars
        ratingLabel.sizeToFit()
        
        
        if let meatPrice = meatObject?.price {
            priceLabel.isHidden = false
            priceLabel.text = ("\(meatPrice)P" )
        } else {
            priceLabel.isHidden = true
        }
        
        descriptionTextView.lineBreakMode = .byWordWrapping
        descriptionTextView.numberOfLines = 0
        descriptionTextView.text = meatObject?.description

    }

}

extension DetailViewController: meatObjectSelectedDelegate {
    func meatObjectSelected(meatObject: Item) {
        self.meatObject = meatObject
    }
}
