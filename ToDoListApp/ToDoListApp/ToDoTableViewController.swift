//
//  ToDoTableViewController.swift
//  ToDoListApp
//
//  Created by Scholar on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
  
    var listOfToDo : [ToDoListAppCD] = []
    
//    override func viewDidLoad() {
    func getToDos() {
        if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            if let dataFromCoreData = try? accessToCoreData.fetch(ToDoListAppCD.fetchRequest()) as? [ToDoListAppCD] {
        
            listOfToDo = dataFromCoreData
            tableView.reloadData()
                
            }
        }
    }
    
//        super.viewDidLoad()
        
//        listOfToDo = createToDo()
//    }
//
//    func createToDo() -> [ToDoClass] {
//        let swiftToDo = ToDoClass()
//        swiftToDo.description = "Learn Swift"
//        swiftToDo.important = true
//
//        let dogToDo = ToDoClass()
//        dogToDo.description = "Walk the dog"
//
//        return [swiftToDo, dogToDo]
//    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        
        cell.textLabel?.text = eachToDo.description
        
        if let thereIsDescription = eachToDo.descriptionInCD {
            if eachToDo.importantInCD {
                cell.textLabel?.text = "‼️" + thereIsDescription
            } else {
                cell.textLabel?.text = eachToDo.descriptionInCD
                
            }
        }
        
//        if eachToDo.importantInCD {
//            cell.textLabel?.text = "‼️" + eachToDo.thereIsDescription
//        } else {
//            cell.textLabel?.text = eachToDo.descriptionInCD
//
//        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let eachToDo = listOfToDo[indexPath.row]
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextToDoListVC = segue.destination as?
            ToDoListViewController {
            nextToDoListVC.previousToDoTVC = self
        }
        
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
            
            if let chosenToDo = sender as? ToDoListAppCD {
                nextCompletedToDoVC.selectedToDo = chosenToDo
            }
            
            nextCompletedToDoVC.previousToDoTVC = self
            if let chosenToDo = sender as? ToDoListAppCD {

        
    }
    

}
}
}
