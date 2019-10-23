//
//  HomeViewController_Ext.swift
//  ActAssignment
//
//  Created by Mahendra Vishwakarma on 23/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController{
    func fetchJSON() {
        CommonUtils.fetchJSONData(fileName: CommonUtils.fileName, decode: { (json) -> Orders? in
            
            guard let response = json as? Orders else{
                return nil
            }
            return response
            
        }) { [weak self] (result) in
            switch result{
                
            case .success(let data):
               
                DispatchQueue.main.async {
                   self?.allOrder = data
                   self?.tableview.reloadData()
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}


// tableview data source

extension HomeViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allOrder != nil ? self.allOrder.sales.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MenuCell else{
            return MenuCell()
        }
        
        cell.setInfo(info: self.allOrder.sales[indexPath.row])
        
        return cell
    }
}
