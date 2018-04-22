//
//  ViewController.swift
//  ApiDataWithImages
//
//  Created by Marcel Widmer on 21.04.18.
//  Copyright © 2018 Marcel Widmer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var heroes = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroViewController{
            destination.hero = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }


    func downloadJson(completed: @escaping () -> ())  {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON Eroro")
                }
            }
        }.resume()
    }

}

