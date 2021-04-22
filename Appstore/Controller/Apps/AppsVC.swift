//
//  AppsVC.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import UIKit

class AppsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.cinza
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    } ()
    
    var appsEmDestaque: [AppDestaque] = []
    var appsGrupos: [AppGrupo] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.backgroundColor = .white
        collectionView.register(AppsGrupoCell.self, forCellWithReuseIdentifier: cellId)
        //collectionView.register(UICollectionReusableView.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizasSuperview()
        
        self.buscaApps()
//        self.buscaAppsEmDestaque()
//        self.buscaGrupos(tipo: "apps-que-amamos")
//        self.buscaGrupos(tipo: "top-apps-gratis")
//        self.buscaGrupos(tipo: "top-apps-pagos")
    }
    
}

extension AppsVC {
    func buscaApps() {
        var appsEmDestaque: [AppDestaque]?
        var appsQueAmamos: AppGrupo?
        var topAppsGratis: AppGrupo?
        var topAppsPagos: AppGrupo?

        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        AppService.shared.buscaAppsEmDestaque { (apps, err) in
            appsEmDestaque = apps
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        AppService.shared.buscaGrupo(tipo: "apps-que-amamos") { (grupo, err) in
            appsQueAmamos = grupo
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        AppService.shared.buscaGrupo(tipo: "top-apps-gratis") { (grupo, err) in
            topAppsGratis = grupo
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        AppService.shared.buscaGrupo(tipo: "top-apps-pagos") { (grupo, err) in
            topAppsPagos = grupo
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            
            if let apps = appsEmDestaque {
                self.appsEmDestaque = apps
            }

            if let apps = appsQueAmamos {
                self.appsGrupos.append(apps)
            }

            if let apps = topAppsGratis {
                self.appsGrupos.append(apps)
            }

            if let apps = topAppsPagos {
                self.appsGrupos.append(apps)
            }
            
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
        
    }
    
//    func buscaAppsEmDestaque() {
//        AppService.shared.buscaAppsEmDestaque { (apps, err) in
//            if let err = err{
//                print(err)
//                return
//            }
//            if let apps = apps {
//                DispatchQueue.main.async {
//                    self.appsEmDestaque = apps
//                    self.collectionView.reloadData()
//                }
//            }
//        }
//    }
//
//
//    func buscaGrupos (tipo: String) {
//        AppService.shared.buscaGrupo(tipo: tipo) { (grupo, err) in
//
//            if let err = err {
//                print(err)
//                return
//            }
//
//            if let grupo = grupo {
//                DispatchQueue.main.async {
//                    self.appsGrupos.append(grupo)
//                    self.collectionView.reloadData()
//                }
//            }
//        }
//
//    }
}

extension AppsVC {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
        
        header.appsEmDestaque = self.appsEmDestaque
        header.collectionView.reloadData()
        
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsGrupos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGrupoCell
        
        cell.grupo = self.appsGrupos[indexPath.item]
        cell.appsGrupoHorizontalVC.callBack = { (app) in
            
            let appDetalheVC = AppDetalheVC()
            
            appDetalheVC.appId = app.id
            appDetalheVC.app = app
            
            self.navigationController?.pushViewController(appDetalheVC, animated: true)
            print(app)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.bounds.width, height: 280)
    }
    
    
}
