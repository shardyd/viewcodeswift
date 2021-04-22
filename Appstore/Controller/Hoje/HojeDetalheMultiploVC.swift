//
//  HojeDetalheMultiploVC.swift
//  Appstore
//
//  Created by Chardson Miranda on 22/04/21.
//

import UIKit

class HojeDetalheMultiploVC: UITableViewController {
    
    let cellId = "cellId"
    
    var hojeApp: HojeApp? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 24)
        tableView.register(HojeMultiploAppCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hojeApp?.apps?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeMultiploAppCell
        cell.app = hojeApp?.apps?[indexPath.item]
        cell.leadingConstraints?.constant = 24
        cell.trailingConstraints?.constant = -24
        return cell
        
    }
}
