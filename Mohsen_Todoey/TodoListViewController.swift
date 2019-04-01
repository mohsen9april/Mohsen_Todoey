//
//  ViewController.swift
//  Mohsen_Todoey
//
//  Created by Mohsen Abdollahi on 4/1/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDOoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
              tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
              tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        //Show the alertview by saving what user input in textfiled
        let alert = UIAlertController(title: "Add New File", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) -> Void in
            let texField = alert.textFields!.first
            self.itemArray.append(texField!.text!)
            self.tableView.reloadData()
        })
        // Write place Holder on this Situation (AlertView)
            alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "Create new item"
    }
        // Final Step in AlertView
        alert.addAction(action)
        present(alert, animated: true , completion: nil)
  }
}
