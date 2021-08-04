//
//  CompletedToDoViewController.swift
//  ToDoListApp
//
//  Created by Scholar on 8/3/21.
//

import UIKit

class CompletedToDoViewController: UIViewController {
    
    var previousToDoTVC = ToDoTableViewController()
    var selectedToDo : ToDoListAppCD?
    
    @IBOutlet weak var completedToDoOutlet: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        completedToDoOutlet.text = selectedToDo?.descriptionInCD
    }
    
    @IBAction func completedToDoButton(_ sender: UIButton) {
        guard let accessCoreData = UIApplication.shared.delegate as? AppDelegate else {        return
        }
        
        let dataFromCoreData = accessCoreData.persistentContainer.viewContext
        
        if let toDoDelete = selectedToDo {
            dataFromCoreData.delete(toDoDelete)
            navigationController?.popViewController(animated: true)
        }
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
