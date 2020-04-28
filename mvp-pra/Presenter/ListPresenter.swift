//
//  ListPresenter.swift
//  mvp-pra
//
//  Created by 山田楓也 on 2020/04/10.
//  Copyright © 2020 Fuuya Yamada. All rights reserved.
//

import Foundation

protocol ListViewPresenterInput: class {
    func requestApiInfo()
}

protocol ListViewPresenterOutput: class {
    func resApiInfo(article: [InfoModel])
    func errorResApi()
}

final class ListPresenter: ListViewPresenterInput {
    
    weak var view: ListViewPresenterOutput?
    private var model: ArticleModelInput
    
    init(view: ListViewPresenterOutput, model: ArticleModelInput) {
        self.view = view
        self.model = model
    }
    
    func requestApiInfo() {
        model.getApiInfo(completion: { [weak self] result in
            guard let self = self else { return }
            if let value = result {
                DispatchQueue.main.sync {
                    self.view?.resApiInfo(article: value)
                }
            } else {
                self.view?.errorResApi()
            }
        })
    }
}
