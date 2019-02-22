//
//  ViewController.swift
//  TodoList
//
//  Created by Darrieumerlou on 19/02/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = true
        itemArray.append( newItem)
        
        let newItem2 = Item()
        newItem2.title = "destroy Demogorgon"
        itemArray.append( newItem2)
        
        let newItem3 = Item()
        newItem3.title = "save the world!"
        itemArray.append( newItem3)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
           itemArray = items
        }
    }
    
    //MARK - TableView Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark: .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at:indexPath, animated: true)
}
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new TodoList item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction( title: "Add item", style: .default){ (action) in
            // what we will happen once the userr clicks the Add item button on our UIAlert
            
           let newItem = Item()
           newItem.title = textField.text!
            
           self.itemArray.append(newItem)
           
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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

