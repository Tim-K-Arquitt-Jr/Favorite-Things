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
    
    var dataForMovies = ["Return of the King", "Star Wars", "No Country for Old Men", "Scott Pilgrim", "Metropolis"]
    var dataForBooks = ["The Hobbit", "Prince Caspian", "Dreams in the Witch House", "Iron Shadows in the Moon", "Out of the Silent Planet"]
    
    //-----Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonLabel1: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    
    //viewDidLoad sets datasource
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

}
    


