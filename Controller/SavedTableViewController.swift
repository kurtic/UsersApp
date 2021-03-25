//
//  SavedTableViewController.swift
//  UsersApp
//
//  Created by Игорь on 23.03.2021.
//

import UIKit
import CoreData
class SavedTableViewController: UITableViewController {
    let idCell = "UserTableViewCell"

    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! UserTableViewCell
        let user:User = users[indexPath.row]
        cell.userImage.load(urlString: user.image!)
        cell.userTitle.text = user.firstName! + " " + user.lastName!
        cell.userSubtitle.text = user.phone
        return cell
    }

    override func viewWillAppear(_ animated: Bool){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do{
            users = try context.fetch(fetchRequest)
            tableView.reloadData()

        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }

}
