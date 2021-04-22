//
//  HojeDetalheUnicoVC.swift
//  Appstore
//
//  Created by Chardson Miranda on 20/04/21.
//

import UIKit

class HojeDetalheUnicoVC: UITableViewController {
    
    var hojeApp: HojeApp? 
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.backgroundColor = .white
        self.adicionarHeader()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(HojeDetalheUnicoCell.self, forCellReuseIdentifier: cellId)
    }
    
    func adicionarHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 448))
        //headerView.backgroundColor = .red
        
        let hojeCell = HojeCell()
        hojeCell.hojeApp = self.hojeApp
        hojeCell.layer.cornerRadius = 0
        
        headerView.addSubview(hojeCell)
        hojeCell.preencherSuperview()
        
        self.tableView.tableHeaderView = headerView
    }
}

extension HojeDetalheUnicoVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeDetalheUnicoCell

        
        return cell
    }
    
}
