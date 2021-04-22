//
//  BuscaVC.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import UIKit

class BuscaVC: UITableViewController, UISearchBarDelegate {
    
    let cellId = "cellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var apps: [App] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BuscaCell.self, forCellReuseIdentifier: cellId)
        
        
        self.configurarSearchBar()
    }
    
    func configurarSearchBar() {
        
        navigationItem.searchController = self.searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "App Store"
        self.searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.buscaApps(texto: searchText)
    }
}

extension BuscaVC{
    func buscaApps (texto: String){
        //BuscaService.shared.buscaApps(texto: texto)
        BuscaService.shared.buscaApps(texto: texto) { (apps, err) in
            
            if let apps = apps {
                DispatchQueue.main.async {
                    
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
        }
    }

}

extension BuscaVC{

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return .init(tableView.bounds.width * 0.8)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BuscaCell
        
        cell.app = self.apps[indexPath.item]
        
        return cell
    }
    
}
