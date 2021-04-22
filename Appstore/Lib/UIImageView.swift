//
//  UIImageView.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import UIKit

extension UIImageView {
    
    static func iconeImageView(witdth: CGFloat = 64, height: CGFloat = 64) -> UIImageView {
        
        let imagem = UIImageView()
        
        imagem.size(size: .init(width: witdth, height: height))
        imagem.backgroundColor = .purple
        imagem.layer.borderWidth = 0.5
        imagem.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imagem.layer.cornerRadius = 12
        imagem.clipsToBounds = true
        
        
        return imagem
    }
    
    static func screenshotImageView() -> UIImageView{
        let imagem = UIImageView()
        
        imagem.backgroundColor = .purple
        imagem.layer.borderWidth = 0.5
        imagem.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imagem.layer.cornerRadius = 12
        imagem.clipsToBounds = true
        imagem.contentMode = .scaleAspectFill

        return imagem
        
    }

    static func hojeImageView(named: String? = nil) -> UIImageView{
        let imagem = UIImageView()

        imagem.translatesAutoresizingMaskIntoConstraints = false
        if let named = named {
            imagem.image = UIImage(named: named)
        }

        imagem.contentMode = .scaleAspectFit
        return imagem
        
    }

}
