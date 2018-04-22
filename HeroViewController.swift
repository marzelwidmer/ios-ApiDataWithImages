//
//  HeroViewController.swift
//  ApiDataWithImages
//
//  Created by Marcel Widmer on 21.04.18.
//  Copyright © 2018 Marcel Widmer. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


class HeroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var attributeLable: UILabel!
    @IBOutlet weak var attackLable: UILabel!
    @IBOutlet weak var legsLable: UILabel!
    
    var hero:HeroStats?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLable.text = hero?.localized_name
        attackLable.text = hero?.primary_attr
        attackLable.text = hero?.attack_type
        legsLable.text = "\((hero?.legs)!)"
        let urlString = "https://api.opendota.com" + (hero?.img)!
        print(urlString)
        let url = URL(string: urlString)
        imageView.downloadedFrom(url: url!)
    }
}
