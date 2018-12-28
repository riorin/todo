//
//  AddTodoViewController.swift
//  todoApp
//
//  Created by Rio Rinaldi on 30/10/18.
//  Copyright © 2018 Rio Rinaldi. All rights reserved.
//

import UIKit
import CoreData

class AddTodoViewController: UIViewController {

    @IBOutlet weak var addtaskLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func savaBtn(_ sender: UIBarButtonItem) {
        guard let title = addtaskLabel.text, !title.isEmpty else {
            return
        }
        
        if let todo = self.todo {
            todo.title = title
            todo.priotity = Int16(segmentedControl.selectedSegmentIndex)
        } else {
            let todo = Todo(context: managedContext)
            todo.title = title
            todo.date = Date()
        }
        
        do {
            try managedContext.save()
            dismissAndResign()
        } catch {
            print("Error saving todo: \(error)")
        }
    }
        
    }
    
    
}
