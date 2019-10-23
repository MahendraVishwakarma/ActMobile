//
//  ViewController.swift
//  ActAssignment
//
//  Created by Mahendra Vishwakarma on 23/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var allOrder : Orders!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchJSON()
        tableview.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }


}

