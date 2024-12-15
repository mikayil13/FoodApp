//
//  FoodCell.swift
//  FoodApp
//
//  Created by Mikayil on 09.12.24.
//

import UIKit

class FoodCell: UICollectionViewCell {
    @IBOutlet private  weak var image: UIImageView!
    @IBOutlet private weak var labeltext: UILabel!
    @IBOutlet weak var itemprice: UILabel!
    @IBOutlet weak var addbutton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addbutton.isHidden = true
        itemprice.isHidden = true
        
        
    }
    
  
    func configure (text: String, imageName: String , price: Double) {
        labeltext.text = text
        image.image = UIImage(named: imageName)
        itemprice.text = String("\(price)$")
        
    }
     
        }
    
    
    
    
    
    
    

