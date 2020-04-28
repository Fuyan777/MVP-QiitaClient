//
//  ApiRequest.swift
//  mvp-pra
//
//  Created by 山田楓也 on 2020/04/10.
//  Copyright © 2020 Fuuya Yamada. All rights reserved.
//
import Foundation

protocol ArticleModelInput {
    func getApiInfo(completion: @escaping ([InfoModel]?) -> Void)
}

struct ApiRequest: ArticleModelInput {
    
    func getApiInfo(completion: @escaping ([InfoModel]?) -> Void) {
        let url = URL(string: "https://qiita.com/api/v2/items")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, res, error) in
            if let error = error {
                print("クライアントエラー: \(error.localizedDescription) \n")
                return
            }
            
            guard let data = data, let response = res as? HTTPURLResponse else {
                print("no data or no response")
                return
            }
            do {
                let articles = try JSONDecoder().decode([InfoModel].self, from: data)
                completion(articles)
            } catch {
                print(error)
                completion(nil)
            }
        }.resume()
    }
}
