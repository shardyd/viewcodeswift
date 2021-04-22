//
//  HojeMultiploAppCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 22/04/21.
//

import UIKit

class HojeMultiploAppCell: UITableViewCell {
    
    var app: App? {
        didSet{
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                tituloLabel.text = app.nome
                empresaLabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(witdth: 48, height: 48)
    let tituloLabel: UILabel = .textLabel(text: "App nome", fontSize: 16)
    let empresaLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let obterButton: UIButton = .obterButton()
    
    var leadingConstraints: NSLayoutConstraint?
    var trailingConstraints: NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel, empresaLabel])
        tituloEmpresaStackView.axis = .vertical
        tituloEmpresaStackView.spacing = 4
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, tituloEmpresaStackView, obterButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        
        //stackView.preencherSuperview(padding: .init(top: 14, left: 0, bottom: 14, right: 0))
        stackView.preencher(top: topAnchor,
                            leading: nil,
                            bottom: bottomAnchor,
                            trailing: nil,
                            padding: .init(top: 14, left: 0, bottom: 14, right: 0)
        )
        
        self.leadingConstraints = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        self.trailingConstraints = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        
        self.leadingConstraints?.isActive = true
        self.trailingConstraints?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
