//
//  HeroViewController.swift
//  ApiDataWithImages
//
//  Created by Marcel Widmer on 21.04.18.
//  Copyright © 2018 Marcel Widmer. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var attributeLable: UILabel!
    @IBOutlet weak var attackLable: UILabel!
    @IBOutlet weak var legsLable: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
