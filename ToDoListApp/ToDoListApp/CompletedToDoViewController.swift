//
//  CompletedToDoViewController.swift
//  ToDoListApp
//
//  Created by Scholar on 8/3/21.
//

import UIKit

class CompletedToDoViewController: UIViewController {
    
    var previousToDoTVC = ToDoTableViewController()
    var selectedToDo = ToDoClass()
    
    @IBOutlet weak var completedToDoOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completedToDoOutlet.text = selectedToDo.description
        
    }
    
    @IBAction func completedToDoButton(_ sender: UIButton) {
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
