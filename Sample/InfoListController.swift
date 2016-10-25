//
//  InfoListController.swift
//  Sample
//
//  Created by user on 2016/10/25.
//  Copyright © 2016年 uluru. All rights reserved.
//

import UIKit

class InfoListController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [(imageUrl: URL?, text: String)]()
    
    var currentText: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 一覧に表示するデータを取得する。
        getData()
        
        // UITableView用設定.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func getData() {
        let data1 = (imageUrl: URL(string:"https://abs.twimg.com/sticky/default_profile_images/default_profile_6_reasonably_small.png"), text: "テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１テスト１")
        let data2 = (imageUrl: URL(string: "https://pbs.twimg.com/profile_images/378800000840982547/5846e6902b035ca1f9edf5b907895205_reasonably_small.jpeg"), text: "test002\ntest2test2")
        let data3 = (imageUrl : URL(string: "https://abs.twimg.com/sticky/default_profile_images/default_profile_6_reasonably_small.png"), text: "テスト３、テストのために追加する。")
        
        dataSource.append(data1)
        dataSource.append(data2)
        dataSource.append(data3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToInfoDetail" {
            guard let controller = segue.destination as? InfoDetailController else {return}
            controller.text = currentText
        }
    }
}

extension InfoListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セル選択した際の動作.
        tableView.deselectRow(at: indexPath, animated: true)
        // 詳細画面へ遷移.
        currentText = dataSource[indexPath.row].text
        self.performSegue(withIdentifier: "ToInfoDetail", sender: nil)
    }
}

extension InfoListController: UITableViewDataSource {
    // セクション数は1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 行数.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // 表示するセルの設定.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InfoCell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
        cell.setCell(data: dataSource[indexPath.row])
        
        return cell
    }
}
