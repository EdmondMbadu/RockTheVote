//
//  ViewController.swift
//  Rock The Vote
//
//  Created by Mbadu, Edmond Ngoma on 12/12/19.
//  Copyright © 2019 Mbadu, Edmond Ngoma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var returnSongName = ""
     var returnVoterName = ""
    var like_dislike = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


   
    
    @IBOutlet weak var songTextField: UITextField!
    
    @IBAction func SongNameDetails(_ sender: UITextField) {
        
       if  let song = songTextField.text {
        let trimmedSongName = song.trimmingCharacters(in: .whitespaces)
        
        if(!trimmedSongName.isEmpty){
            returnSongName = trimmedSongName
            
            }
        }
    
    }
    
    
    @IBOutlet weak var VoterName: UITextField!
    @IBAction func VoterNamesDetails(_ sender: Any) {
   if  let voter = songTextField.text {
   let trimmedVoterName = voter.trimmingCharacters(in: .whitespaces)
   
   if(!trimmedVoterName.isEmpty){
       returnVoterName = trimmedVoterName
    
       
       }
   }
    }
    
    
    // if the button like is pushed segue to the table view controller
    // and send the information true
    @IBAction func goToTableView(_ sender: UIButton) {
        
        
     performSegue(withIdentifier: "GotoViewController", sender: nil)
        like_dislike = "true"
        
    }
    // on the other hand, if the dislike button is pushed, segue to the table view controller
    // and send the information false
    
    @IBAction func goToTableViewD(_ sender: UIButton) {
          performSegue(withIdentifier: "GotoViewController", sender: nil)
         like_dislike = "false"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              
              // if we're segueeing to the View Controller that has the identifier
              // GodToTableView
              if segue.identifier == "GoToTableView" {
                  
                  // create an instance of that View Controller
                  // checking if teh sequte destination is castqable to a NewTableController
                  // and cast it if it is, else return nil
            let  newTableViewController = segue.destination as? NewTableViewController
                  // set the instance's tipToHosw property equal to the calculated tip
                newTableViewController?.SName = returnSongName
                newTableViewController?.SVoter = returnVoterName
                newTableViewController?.LiKeDislike = like_dislike
                
                
                
        }
    }
}

