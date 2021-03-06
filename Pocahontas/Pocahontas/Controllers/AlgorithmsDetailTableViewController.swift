//
//  AlgorithmsDetailTableViewController.swift
//  Pocahontas
//
//  Created by Alina Zaitseva on 5/7/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class AlgorithmsDetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    @IBOutlet var containerTableView: UIView!
    var entitySource = AlgorithmsSourceEntity()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entitySource.countOfAlgorithmsType
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SortViewCell", for: indexPath) as? SortViewCell {
            cell.sortViewLabel.text = entitySource.getValueInSourceEntity(item: indexPath.row)
            return cell
        } else { return UITableViewCell() }
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
    let visualizeViewController = storyboard.instantiateViewController(withIdentifier: "VisualizeSortViewController") as! VisualizeSortViewController
    let selectedEntity = AlgorithmsSourceEntity()
        visualizeViewController.dataEntity = selectedEntity
    let factory = FactoryManagerTypeSort()
    let type = TypeSortEnum.Insert
        visualizeViewController.sortModel = factory.getTypeSort(type: type)
        self.navigationController?.pushViewController(visualizeViewController, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
