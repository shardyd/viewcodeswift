//
//  HojeService.swift
//  Appstore
//
//  Created by Chardson Miranda on 22/04/21.
//

import Foundation

class HojeService {
    static let shared = HojeService()
    
    func buscaHojeDestaques (completion: @escaping([HojeApp]?, Error?) -> () ) {
        
        var hojeApps: Array<HojeApp> = [
            
            HojeApp(id: 1,
                    categoria: "VIAGEM",
                    titulo: "Explore o mundo \nsem medo",
                    imagemUrl: "destaque-1",
                    descricao: "podemos viajar o mundo em busca da beleza, mas nunca encontraremos se não a carregarmos dentro de nós",
                    backgroundColor: "#000",
                    apps: nil
            ),
            
            HojeApp(id: 2,
                    categoria: "PRATIQUE HOJE",
                    titulo: "Mantenha o corpo \ne a mente saudaveis",
                    imagemUrl: "destaque-2",
                    descricao: "podemos viajar o mundo em busca da beleza, mas nunca encontraremos se não a carregarmos dentro de nós",
                    backgroundColor: "#68CCE0",
                    apps: nil
            )
        ]

        AppService.shared.buscaApps { (apps, err) in
            if let apps = apps {
                hojeApps.append(
                    HojeApp(id: 3,
                            categoria: "A LISTA DO DIA",
                            titulo: "Pedale melhor com \n apple watch",
                            imagemUrl: nil,
                            descricao: nil,
                            backgroundColor: nil,
                            apps: apps
                    )
                )
            }
            completion(hojeApps, nil)
        }
    }
    
    
}
