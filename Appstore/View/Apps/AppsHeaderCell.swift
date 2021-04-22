//
//  AppsHeaderCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    var appDestaque: AppDestaque? {
        didSet{
            if let appDestaque = appDestaque {
                
                empresaLabel.text = appDestaque.nome
                descricaoLabel.text = appDestaque.descricao
                imagemImageView.sd_setImage(with: URL(string: appDestaque.imagemUrl), completed: nil)
                
            }
        }
    }
    
    let empresaLabel: UILabel = .textLabel(text: "App empresa", fontSize: 12)
    let descricaoLabel: UILabel = .textLabel(text: "App descriçao header", fontSize: 20, numberOfLines: 2)
    let imagemImageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        empresaLabel.textColor = UIColor.azul
        
        let stackView = UIStackView(arrangedSubviews: [empresaLabel, descricaoLabel, imagemImageView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
