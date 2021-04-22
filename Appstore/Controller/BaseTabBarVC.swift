//
//  BaseTabBarVC.swift
//  Appstore
//
//  Created by Chardson Miranda on 15/04/21.
//

import UIKit

class BaseTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hojeVC = self.criarTabItem(viewController: HojeVC(), titulo: "Hoje", imagem: "icone-hoje")
        let appsVC = self.criarTabItem(viewController: AppsVC(), titulo: "Produtos", imagem: "icone-apps")
        let buscaVC = self.criarTabItem(viewController: BuscaVC(), titulo: "Busca Produtos", imagem: "icone-busca")

        viewControllers = [
            hojeVC,
            appsVC,
            buscaVC
        ]
        
        selectedIndex = 0
    }
    
    func criarTabItem(viewController: UIViewController, titulo: String, imagem: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = titulo
        viewController.tabBarItem.title = titulo
        viewController.tabBarItem.image = UIImage(named: imagem)
        //viewController.view.backgroundColor = .white
        
        return navController
        
    }
    
}
