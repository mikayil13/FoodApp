//
//  basketController.swift
//  FoodApp
//
//  Created by Mikayil on 12.12.24.
//

import UIKit

class basketController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    var basket: [Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self

        
    }
    

  

}
extension basketController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketControllerCell") as! basketControllerCell
        return cell
        
    }
}
