//
//  BurgerMenu.swift
//  FoodApp
//
//  Created by Mikayil on 09.12.24.
//

import UIKit

class BurgerMenu: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    var selectedFood: Food?
    var images: [UIImage] = []
    var item: [FoodItem] = []
    var price: Double? = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    func setup() {
        title = "Foods"
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "FoodCell", bundle: nil), forCellWithReuseIdentifier: "FoodCell")
        collection.collectionViewLayout = UICollectionViewFlowLayout()
        
        
    }
}

extension BurgerMenu: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedFood?.item?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
        cell.configure(text: selectedFood?.item?[indexPath.item].itemName ?? "", imageName: selectedFood?.item?[indexPath.item].itemImage ?? "", price: selectedFood?.item?[indexPath.item].price ?? 0)
            cell.itemprice.isHidden = false
            cell.addbutton.isHidden = false
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            .init(width: 400, height: 400)
        }
    }

