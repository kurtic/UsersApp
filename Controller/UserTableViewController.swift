//
//  UserTableViewController.swift
//  UsersApp
//
//  Created by Игорь on 21.03.2021.
//

import UIKit

class UserTableViewController: UITableViewController {

    let urlString = "https://randomuser.me/api/?results=10"
    let idCell = "UserTableViewCell"
    var serverResponse: ServerResponse? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)

        ApiService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let serverResponse):
                self?.serverResponse = serverResponse
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! UserTableViewCell
        let user = serverResponse?.results[indexPath.row]
        cell.userTitle.text = "\(user?.name.first ?? "Name")  \(user?.name.last ?? "Surname")"
        cell.userSubtitle.text = user?.phone
        cell.userImage.load(urlString: (user?.picture?.large)!)
        return cell
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serverResponse?.info.results ?? 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "goToProfile", sender: indexPath)


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfile" {
            let vc = segue.destination as! EditUserViewController
            let indexPath = sender as! IndexPath
            let user = serverResponse?.results[indexPath.row]
            vc.user = user
        }
    }



}


extension UIImageView {
    func load(urlString: String) {
        let url = URL(string: urlString)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
