//
//  AppDetalheHeaderCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 18/04/21.
//

import UIKit

class AppDetalheHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nomeLabel.text = app.nome
                empresaLabel.text = app.empresa
            }
            
        }
        
    }
    
    let iconeImageView: UIImageView = .iconeImageView(witdth: 128, height: 128)
    let nomeLabel: UILabel = .textLabel(text: "App nome", fontSize: 20, numberOfLines: 2)
    let empresaLabel: UILabel = .textLabel(text: "Empresa", fontSize: 14)
    let obterButton: UIButton = .obterButton()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        iconeImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView(arrangedSubviews: [obterButton, UIView()])
        
        let tituloEmpresaStackView = UIStackView(arrangedSubviews: [nomeLabel, empresaLabel, buttonStackView])
        tituloEmpresaStackView.spacing = 12
        tituloEmpresaStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, tituloEmpresaStackView])
        stackView.alignment = .center
        stackView.spacing = 12

        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


