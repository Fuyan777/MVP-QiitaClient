//
//  ViewController.swift
//  mvp-pra
//
//  Created by 山田楓也 on 2020/04/10.
//  Copyright © 2020 Fuuya Yamada. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    
    private var presenter: ListViewPresenterInput!
    private var articleList = [InfoModel]()
    
    @IBOutlet var listTableView: UITableView! {
        didSet {
            listTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            listTableView.delegate = self
            listTableView.dataSource = self
            listTableView.separatorStyle = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ListPresenter(view: self, model: ApiRequest())
        presenter.requestApiInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailView = segue.destination as! DetailListViewController
            detailView.url = sender as! String
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        cell.draw(article: articleList[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = articleList[indexPath.row].url
        self.performSegue(withIdentifier: "toDetail", sender: url)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: ListViewPresenterOutput {
    func resApiInfo(article: [InfoModel]) {
        articleList = article
        listTableView.reloadData()
    }
    
    func errorResApi() {
        print("error: errorResApi")
    }
}
