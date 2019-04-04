//
//  ViewController.swift
//  Favourite Stuff
//
//  Created by Timothy Arquitt on 4/3/19.
//  Copyright © 2019 Tim Arquitt, Jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //Variables
    
    var booksLoaded = false
    var booksOrMovies = 1
    
    //Data set
    
    var dataForMovies = ["Return of the King", "Star Wars", "No Country for Old Men", "Scott Pilgrim", "Fritz Lang Metropolis"]
    var dataForBooks = ["The Hobbit", "Prince Caspian", "Dreams in the Witch House", "Iron Shadows in the Moon", "Out of the Silent Planet"]
    
    //-----Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonLabel1: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        
}
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if booksLoaded == false {
            return dataForMovies.count
        }
        if booksLoaded == true {
            return dataForBooks.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellInTabel")
        
        
        if booksLoaded == false {
            let holderText = dataForMovies[indexPath.row]
            myCell?.textLabel?.text = holderText
        }
        if booksLoaded == true {
            let holderTextTwo = dataForBooks[indexPath.row]
            myCell?.textLabel?.text = holderTextTwo
        }
        
        return myCell!
    }
    
    //Button func
    
   
    @IBAction func buttonPressed(_ sender: Any) {
        
        //checks if books are already showing
        switch booksOrMovies {
        case 1:
            booksLoaded = true
            booksOrMovies += 1
            myTableView.reloadData()
            buttonLabel1.titleLabel?.text = "SWITCH TO BOOKS"
        case 2:
            booksLoaded = false
            booksOrMovies -= 1
            myTableView.reloadData()
             buttonLabel1.titleLabel?.text = "SWITCH TO MOVIES"
        default:
            break
    }
}
    
    
    @IBAction func removePressed(_ sender: Any) {
        switch booksLoaded {
        case true:
            dataForBooks.removeLast()
            myTableView.reloadData()
        
        case false:
            dataForMovies.removeLast()
            myTableView.reloadData()
        }
    
    }
    
    
//    @IBAction func addPressed(_ sender: Any) {
    
//        if textFieldOutlet.text != ""{
    
//    booksLoaded == false{
//    dataForMovies.insert(textFieldOutlet.text ?? "default", at: 0)
//        self.myTableView.reloadData
//    }
//        else{
//            dataForBooks.insert(textFieldOutlet.text ?? "default", at: 0)
//            myTableView.reloadData()
//        }
//        }
    
    
//    }
}
    


