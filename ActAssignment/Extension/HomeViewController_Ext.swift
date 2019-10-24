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
                   self?.filteredData = data?.sales ?? []
                   self?.filterProducts()
                   self?.tableview.reloadData()
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    func setupDropDown(){
         dropDownView = DropDownView(frame: CGRect(x: 10, y: 0, width: self.view.frame.width-20, height: 0))
        dropDownView.delegate = self
         self.view.addSubview(dropDownView)
        tableview.tableFooterView = UIView(frame: .zero)
    }
    
    // drop down frame
    func dropDownFrame() {
        
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        let heightt = self.dropDownView.frame.height == 0 ? 290 : 0
        
      //  UIView.animate(withDuration: 0.1) {
            self.dropDownView.frame = CGRect(x: Int(self.dropDownView.frame.origin.x), y: Int(topBarHeight), width: Int(self.dropDownView.frame.width), height: heightt)
     //   }
        
    }
    
    func filterProducts() {
        
        let categories = allOrder.sales.compactMap { $0.prod }
        let productNames = Array(Set(categories))
        self.dropDownView.productsName = productNames
        self.dropDownView.updateProductNames()
       
    }
}

extension HomeViewController:PassDataDelegate{
    func sendData(data: String) {
        
        self.title = "selected product: " + data
        filteredData.removeAll()
        let filterData = allOrder.sales.filter({$0.prod.contains(data)})
        
        for order in filterData{
            let obj = Sale(prod: "", country: order.country, price: order.price)
            if(filteredData.contains(where: {$0.country == obj.country})) {
                print("already exist")
                let index = filteredData.firstIndex(where: {$0.country == obj.country}) ?? 0
                let object = filteredData[index]
                var objMod = Sale(prod: object.prod, country: object.country, price: object.price)
                objMod.price = object.price + obj.price
                filteredData[index] = objMod
            }else{
                filteredData.append(obj)
            }
        }
        
     let sortedData = filteredData.sorted(by: { $0.price > $1.price })
        filteredData = sortedData
        print(filteredData)
       tableview.reloadData()
    }

}

extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

// tableview data source

extension HomeViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MenuCell else{
            return MenuCell()
        }
        
        cell.setInfo(info: filteredData[indexPath.row])
        
        return cell
    }
}


extension UIView {
    func setFrameInView(_ container: UIView!) -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
