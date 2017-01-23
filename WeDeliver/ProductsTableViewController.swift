//
//  ProductsTableViewController.swift
//  WeDeliver
//
//  Created by Marcus Eagan on 1/16/17.
//  Copyright © 2017 Marcus Eagan. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var productNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNames = ["1907 Wall Set", "1921 Dial Phone",
                        "1937 Desk Set", "1984 Motorola Portable"]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let pNames = productNames {
            return pNames.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let productName = productNames?[indexPath.row]
        
        if let pName = productName {
            
            cell.textLabel?.text = pName
        }

        cell.imageView?.image = UIImage(named: "image-cell1")
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destination as? ProductViewController
            
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
                    return
            }
            productVC?.productName = productNames?[indexPath.row]
            
        }
    }
}
