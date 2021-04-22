//
//  AppService.swift
//  Appstore
//
//  Created by Chardson Miranda on 16/04/21.
//

import Foundation

class AppService {
    
    static let shared = AppService()
    let API = "https://api.euprogramador.app/app-store/v1"
    
    
    func buscaAppsEmDestaque(completion: @escaping ([AppDestaque]?, Error?) -> ()) {
        
        guard let url = URL(string: "\(API)/apps/apps-em-destaque") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                
                let apps = try JSONDecoder().decode([AppDestaque].self, from: data)
                completion(apps, nil)
                
            } catch {
                completion(nil, err)
                return
            }
            
        }.resume()
        
    }
    
    func buscaGrupo (tipo: String, completion: @escaping(AppGrupo?, Error?) -> ()) {
        
        guard let url = URL(string: "\(API)/apps/\(tipo)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                
                let apps = try JSONDecoder().decode(AppGrupo.self, from: data)
                completion(apps, nil)
                
            } catch {
                completion(nil, err)
                return
            }
            
        }.resume()
    }

    func buscaAppId (appId: Int, completion: @escaping(App?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps/\(appId)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
                
            } catch {
                completion(nil, err)
                return
            }
            
        }.resume()
    }
    
    func buscaApps (completion: @escaping([App]?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                
                let apps = try JSONDecoder().decode([App].self, from: data)
                completion(apps, nil)
                
            } catch {
                completion(nil, err)
                return
            }
            
        }.resume()
    }
}

