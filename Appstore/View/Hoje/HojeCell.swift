//
//  HojeCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 20/04/21.
//

import UIKit

class HojeCell: UICollectionViewCell {
    
    var hojeApp: HojeApp? {
        didSet {
            
            if let hojeApp = hojeApp {
                
                categoriaLabel.text = hojeApp.categoria
                tituloLabel.text = hojeApp.titulo
                descricaoLabel.text = hojeApp.descricao
                
                if let imagem = hojeApp.imagemUrl {
                    imageView.image = UIImage(named: imagem)
                }
                
                if let background = hojeApp.backgroundColor{
                    self.backgroundColor = UIColor(hexString: background)
                }
            }
        }
    }
    
    let categoriaLabel: UILabel = .textLabel(text: "Viagem", fontSize: 18)
    let tituloLabel: UILabel = .textboldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
    let imageView: UIImageView = .hojeImageView(named: "destaque-1" )
    let descricaoLabel: UILabel = .textLabel(text: "Podemos viajar o mundo em busca das belezas, mas nunca encontraremos se nao carregarmos dentro de nos", fontSize: 14, numberOfLines: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       // backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxView = UIView()
        boxView.clipsToBounds = true
        boxView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imageView.size(size: .init(width: bounds.width, height: 250))
        
        
        let stackView = UIStackView(arrangedSubviews: [categoriaLabel, tituloLabel, boxView, descricaoLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        //stackView.preencherSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackView.preencher(top: self.safeAreaLayoutGuide.topAnchor,
                            leading: leadingAnchor,
                            bottom: bottomAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
