//
//  UIButton.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import UIKit

extension UIButton {
    
    static func obterButton() -> UIButton{
        
        let button = UIButton(type: .system)
        button.setTitle("Obter", for: .normal)
        button.setTitleColor(UIColor.azul, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        button.size(size: .init(width: 80, height: 32))
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }
 
    static func fecharButton () -> UIButton{
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "fechar"), for: .normal)
        button.layer.zPosition = 2
        
        return button
    }
    
}
