//
//  NewTableViewController.swift
//  Rock The Vote
//
//  Created by Mbadu, Edmond Ngoma on 12/12/19.
//  Copyright © 2019 Mbadu, Edmond Ngoma. All rights reserved.
//

import UIKit

import CoreData

class NewTableViewController: UITableViewController {

     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var SName = ""
    var SVoter = ""
    var LiKeDislike = ""
    var voteLists = [VoteList] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVoteLists()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
         performSegue(withIdentifier: "GotoViewController", sender: nil)
    }
    
//    / This method creates an instance of the View Controller that's being
    // segued to  and it psses the Veiw Controller the calculated tip
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if we're segueeing to the View Controller that has the identifier
        // GodToNewView
        if segue.identifier == "GotoViewController" {
            
            // create an instance of that View Controller
            // checking if teh sequte destination is castqable to a NewViewController
            // and cast it if it is, else return nil
            _ =  segue.destination as? ViewController
            // set the instance's tipToHosw property equal to the calculated tip
            
            
      
         
          
        }
    }
    func loadVoteLists(){
          // Create an instance of a FetchRequest so that
          // ShoppingList can be fetched from Core Data
          let request: NSFetchRequest<VoteList> = VoteList.fetchRequest()
      
          do{
              // use context to execute a fetch request
              // to fetch ShoppingLists from Core Data
              // store the fetched ShoppingLists in our array
              voteLists = try context.fetch(request)
          }catch {
              print("Error fetching VoteLists from Core Data!")
          }
          
          // reload the fetched data in the Table View Controller
          tableView.reloadData()
      }
    func saveVotelists(){
          do {
              // use context to save ShoppingLists into Core Data
              try context.save()
          }catch {
              print("Error saving VoteLists to Core Data!")
          }
          // reload the data in the Table View Controller
          tableView.reloadData()
      }
      

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoteCell", for: indexPath)

        // Configure the cell...
    

        //         Configure the cell...
            
//                let voteList = voteLists[indexPath.row]
        cell.textLabel?.text = SName
        cell.detailTextLabel?.text = SVoter + " " + LiKeDislike
                return cell

        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
