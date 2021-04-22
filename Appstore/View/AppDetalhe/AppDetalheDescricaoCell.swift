//
//  AppDetalheDescricaoCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 18/04/21.
//

import UIKit

class AppDetalheDescricaoCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                descricaoLabel.text = app.descricao
             }
        }
    }
    
    let tituloLabel: UILabel = .textboldLabel(text: "Novidades", fontSize: 24)
    let descricaoLabel: UILabel = .textLabel(text: "Descrição", fontSize: 12, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [tituloLabel, descricaoLabel])
        stackView.spacing = 12
        stackView.axis = .vertical
        
        addSubview(stackView)
        
        stackView.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
