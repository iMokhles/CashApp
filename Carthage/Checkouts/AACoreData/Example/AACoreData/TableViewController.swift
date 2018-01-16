//
//  TableViewController.swift
//  AACoreData
//
//  Created by Engr. Ahsan Ali on 27/12/2016.
//  Copyright © 2016 AA-Creations. All rights reserved.
//

import UIKit
import AACoreData

class TableViewController: UITableViewController {
    
    
    let instance = AACoreData.sharedInstance()
    
    var itemCounter: Int = 0
    
    var records: [ExampleEntity] = [ExampleEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.tableView.allowsSelectionDuringEditing = true

        fetchRecords()
        
    }
    
    func fetchRecords() {
        let sorter = NSSortDescriptor(key: "name" , ascending: true)
        

        instance.fetchRecords(entityName: .Example, sortDescriptors: [sorter]) { (results) in
            if let result = results as? [ExampleEntity] {
                self.records = result
                self.tableView.reloadData()
            }
            else {
                print("AACoreData - NO RECORDS FOUND")
            }
        }
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let entity = records[indexPath.row]
        cell.textLabel?.text = entity.name!
        cell.detailTextLabel?.text = entity.address!
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let counter = indexPath.row + 1
        let record = records[indexPath.row]
        record.name = "Updated Name \(counter)"
        record.address = "Updated Address \(counter)"
        instance.saveContext()
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .fade)
        print("AACoreData - Updated!")
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let record = records[indexPath.row]
            instance.deleteRecord(record)
            records.remove(at: indexPath.row)
            instance.saveContext()
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .right)
            tableView.endUpdates()
            print("AACoreData - Deleted!")
        }
    }
    
    @IBAction func eraseAction(_ sender: Any) {
        
        instance.deleteAllRecords(entity: .Example)
        records.removeAll()
        tableView.reloadData()
        
        
    }
    @IBAction func addAction(_ sender: Any) {
        
        let counter = records.count + 1
        
        let record = instance.getNewObject(entityName: .Example) as! ExampleEntity
        record.name = "Demo Name: \(counter)"
        record.address = "Demo Address: \(counter)"
        records.append(record)
        instance.saveContext()
        
        let indexPath = IndexPath(row: records.count-1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .left)
        tableView.endUpdates()
        print("AACoreData - Inserted!")
        
    }
}
