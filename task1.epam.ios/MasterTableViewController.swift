//
//  MasterTableViewController.swift
//  task1.epam.ios
//
//  Created by XO on 13.06.2021.
//  Copyright © 2021 XO. All rights reserved.
//

import UIKit

protocol meatObjectSelectedDelegate: class {
    func meatObjectSelected(meatObject: Item) 
}

class MasterTableViewController: UITableViewController {
    let identifier = "oneCell"
    let meat = Item.fetchItems()
    
    weak var delegate: meatObjectSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meat.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let currentItem = meat[indexPath.row]
        
        
        cell.textLabel?.text = currentItem.title
        if let price = currentItem.price {
            cell.detailTextLabel?.text = "\(String(describing: price))"
        } else {
            cell.detailTextLabel?.text = ""
            cell.detailTextLabel?.isHidden = true
        }

        if cell.detailTextLabel == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        }
        cell.textLabel?.text = currentItem.title
        if let price = currentItem.price {
            cell.detailTextLabel?.text = "\(String(describing: price))"
        } else {
            cell.detailTextLabel?.text = ""
        }

        
        let image = UIImage(named: currentItem.imageName)
        cell.imageView?.image = image
        cell.imageView?.layer.cornerRadius = 24
        cell.imageView?.contentMode = .scaleToFill
        cell.imageView?.layer.masksToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMeat = meat[indexPath.row]
        delegate?.meatObjectSelected(meatObject: currentMeat)
        
        if let detailViewController = delegate as? DetailViewController {
                splitViewController?.showDetailViewController(detailViewController, sender: nil)
            }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
