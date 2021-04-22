//
//  HojeDetalheUnicoCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 22/04/21.
//

import UIKit

class HojeDetalheUnicoCell: UITableViewCell {
    
    let descricaoLabel: UILabel = {
        
        let label = UILabel()
        
        let atributoTexto = NSMutableAttributedString (string: "lerem ipsum",
                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        
        atributoTexto.append(NSMutableAttributedString (string: "Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto ",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
         ))
        
        atributoTexto.append(NSMutableAttributedString (string: "\n\nDe onde ele vem ",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondarySystemBackground]
         ))

        atributoTexto.append(NSMutableAttributedString (string: "Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto Simulacao de texto ",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
         ))

        
        
        label.attributedText = atributoTexto
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descricaoLabel)
        descricaoLabel.preencherSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
