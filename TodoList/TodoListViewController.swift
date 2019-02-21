//
//  ViewController.swift
//  TodoList
//
//  Created by Darrieumerlou on 19/02/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy eggs", "Destory Demorgon"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - TableView Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at:indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at:indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at:indexPath)?.accessoryType = .checkmark
        }
        
    
    
        tableView.deselectRow(at:indexPath, animated: true)
}
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new TodoList item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction( title: "Add item", style: .default){ (action) in
            // what we will happen once the userr clicks the Add item button on our UIAlert
            
           self.itemArray.append(textField.text! )
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text)
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

