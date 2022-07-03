//
//  CartViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 7/2/22.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableDetails: [TableViewData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let tableDetails = [TableViewData(deviceName: "iPhone XS", description: "Storage 64GB, Black", price: "$999.00", units: "1 Unit", image: UIImage(named: "iphone-x-and-iphone-8-png-12")!)]

    }

    @IBAction func backToCameraBtn(_ sender: Any) {
        let ViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "ViewController")
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderCartTableViewCell.identifier, for: indexPath) as! OrderCartTableViewCell
        cell.setup(tableDetails[indexPath.row])
        return cell
    }
    
    
}
