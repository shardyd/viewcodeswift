//
//  HojeHeader.swift
//  Appstore
//
//  Created by Chardson Miranda on 22/04/21.
//

import UIKit

class HojeHeader: UICollectionReusableView {
    
    let dataLabel: UILabel = .textLabel(text: "Domingo, 1 de abril", fontSize: 14)
    
    let tituloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        return label
    }()
    
    let perfilImagem: UIImageView = {
        let imagem = UIImageView()
        imagem.size(size: .init(width: 36, height: 36))
        imagem.layer.cornerRadius = 18
        imagem.clipsToBounds = true
        imagem.image = UIImage(named: "perfil")
        imagem.contentMode = .scaleAspectFill
        return imagem
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dataLabel)
        dataLabel.preencher(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: nil,
                            padding: .init(top: 32, left: 24, bottom: 0, right: 0)
        )

        addSubview(tituloLabel)
        tituloLabel.preencher(top: nil,
                            leading: leadingAnchor,
                            bottom: bottomAnchor,
                            trailing: nil,
                            padding: .init(top: 0, left: 24, bottom: 0, right: 0)
        )

        addSubview(perfilImagem)
        perfilImagem.preencher(top: nil,
                            leading: nil,
                            bottom: bottomAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 0, left: 0, bottom: 0, right: 24)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
