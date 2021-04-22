//
//  AppDetalheVC.swift
//  Appstore
//
//  Created by Chardson Miranda on 18/04/21.
//

import UIKit

class AppDetalheVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let descricaoId = "descricaoId"
    let screenshotId = "screenshotId"
    let avaliacaoId = "avaliacaoId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.color = .cinza
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var appId: Int! {
        didSet {
            self.buscaApp(appId: appId)
        }
    }
    var app: App?
    var loading: Bool = true
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        //collectionView.backgroundColor = .white
        collectionView.register(AppDetalheHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppDetalheDescricaoCell.self, forCellWithReuseIdentifier: descricaoId)
        collectionView.register(AppDetalheScreenshotCell.self, forCellWithReuseIdentifier: screenshotId)
        collectionView.register(AppDetalheAvaliacaoCell.self, forCellWithReuseIdentifier: avaliacaoId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizasSuperview()
        
    }

    func buscaApp (appId: Int) {
        AppService.shared.buscaAppId(appId: appId) { (app, err) in
            if let app = app {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.loading = false
                    self.app = app
                    self.collectionView.reloadData()
                }
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.loading ? 1 : 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetalheHeaderCell
            cell.app = self.app
            return cell
        }

        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descricaoId, for: indexPath) as! AppDetalheDescricaoCell
            cell.app = self.app
            return cell
        }

        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId, for: indexPath) as! AppDetalheScreenshotCell
            cell.app = self.app
            return cell
        }

        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: avaliacaoId, for: indexPath) as! AppDetalheAvaliacaoCell
            cell.app = self.app
            return cell
        }

        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let viewWidth: CGFloat = view.bounds.width
        var viewHeight: CGFloat = 170

        if indexPath.item == 1 {
            let descricaoCell = AppDetalheDescricaoCell(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 1000))
            
            descricaoCell.app = self.app
            descricaoCell.layoutIfNeeded()
            
            let estimativaTamanhoCell = descricaoCell.systemLayoutSizeFitting(CGSize(width: viewWidth, height: 1000))
            viewHeight = estimativaTamanhoCell.height
        }
        
        if indexPath.item == 2 {
            viewHeight = 550
        }

        if indexPath.item == 3 {
            viewHeight = 280
        }

        return .init(width: viewWidth, height: viewHeight)
    }
}
