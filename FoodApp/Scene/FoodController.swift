//
//  FoodController.swift
//  FoodApp
//
//  Created by Mikayil on 07.12.24.
//

import UIKit

class FoodController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = FoodViewModel()
    var foodList = [Food]()
    var images: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getup()
        getfoodList()
        
    }
    func getup() {
        
        title = "Home"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(UINib(nibName: "FoodCell", bundle: nil), forCellWithReuseIdentifier: "FoodCell")
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket.fill"), style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
   
        @objc func buttonTapped() {
            let controller = storyboard?.instantiateViewController(withIdentifier: "basketController") as! basketController
            navigationController?.show(controller, sender: nil)
    }

    func getfoodList() {
        if  let fileURL =  Bundle.main.url(forResource: "Food", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                foodList = try JSONDecoder().decode([Food].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
   
extension FoodController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
        cell.configure(text: foodList[indexPath.row].foodName ?? "", imageName: foodList[indexPath.row].foodImage ?? "" , price: 0)
        cell.itemprice.isHidden = true
        cell.addbutton.isHidden = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 400, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "BurgerMenu") as! BurgerMenu
            controller.selectedFood = foodList[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    

    
    
    
    
    
    
    
    
    

