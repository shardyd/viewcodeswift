//
//  BuscaCell.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import UIKit
import SDWebImage

class BuscaCell: UITableViewCell {
    
    var app: App! {
        didSet{
            tituloLabel.text = app.nome
            empresaLabel.text = app.empresa
            
            //-- forma nativa que deixa o app lento
//            DispatchQueue.main.async {
//                if let url = URL(string: self.app.iconeUrl){
//                    do {
//                        let data = try Data(contentsOf: url)
//                        self.iconeImageView.image = UIImage(data: data)
//
//                    } catch let err {
//                        print(err)
//                    }
//
//                }
//            }
            
            //-- forma usando biblioteca de terceiro
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            if let screenshotUrls = app.screenshotUrls{
                if screenshotUrls.count > 0 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenshotUrls[0]), completed: nil)
                }
                if screenshotUrls.count > 1 {
                    self.screenshot2ImageView.sd_setImage(with: URL(string: screenshotUrls[1]), completed: nil)
                }
                if screenshotUrls.count > 2 {
                    self.screenshot3ImageView.sd_setImage(with: URL(string: screenshotUrls[2]), completed: nil)
                }

            }
        }
    }
    
    
    let iconeImageView: UIImageView = .iconeImageView()
    let tituloLabel: UILabel = .textLabel(text: "App Nome", fontSize: 18, numberOfLines: 2)
    let empresaLabel: UILabel = .textLabel(text: "Empresa Nome", fontSize: 14)
    let obterButtom: UIButton = .obterButton()
    let screenshot1ImageView: UIImageView = .screenshotImageView()
    let screenshot2ImageView: UIImageView = .screenshotImageView()
    let screenshot3ImageView: UIImageView = .screenshotImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel, empresaLabel])
        tituloEmpresaStackView.spacing = 8
        tituloEmpresaStackView.axis = .vertical

        let headerStackView = UIStackView(arrangedSubviews: [iconeImageView, tituloEmpresaStackView, obterButtom])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView,
            screenshot2ImageView,
            screenshot3ImageView
        ])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let globalStackView = UIStackView(arrangedSubviews: [
            headerStackView,
            screenshotStackView
        ])
        
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        addSubview(globalStackView)
        globalStackView.preencherSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
        
    
    
}
