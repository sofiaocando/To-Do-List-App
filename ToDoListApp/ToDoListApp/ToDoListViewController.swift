//
//  ToDoListViewController.swift
//  ToDoListApp
//
//  Created by Scholar on 8/2/21.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    var previousToDoTVC = ToDoTableViewController()
    
    @IBOutlet weak var descriptionOutlet: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addToDoButton(_ sender: UIButton) {
        let newToDo = ToDoClass()
        
        if let checkForInput = descriptionOutlet.text {
            newToDo.description = checkForInput
            newToDo.important = importantSwitch.isOn
        }
        
        previousToDoTVC.listOfToDo.append(newToDo)
        previousToDoTVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
