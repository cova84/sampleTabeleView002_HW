//
//  ViewController.swift
//  sampleTabeleView001
//
//  Created by 小林由知 on 2017/10/30.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit


//1.プロトコルの設定（UITableViewDataSource,UITableViewDelegateの追加）
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    //表示したいデータ（配列）
    var teaList = ["ダージリン", "アールグレイ", "アッサム", "オレンジペコ", "ああああああああああああああああああああああああああああああああああああああああああああああおかゆさんがああああああああ"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //2. 行数の表示（numberOfRowsInSectionを検索）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teaList.count //.countが配列の数だけ繰り返す
    }
    
    //3. リストに表示する文字列を決定し、表示（cellForRowAtを検索）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字列を表示するセルの取得（セルの再利用）
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //表示したい文字の設定（セルの中には文字、画像も入る）
        cell.textLabel?.text = teaList[indexPath.row]
        cell.textLabel?.font = UIFont(name: "AmericanTypewriter", size: 50)
//文字数が多い時の対応方法はWhat!?        //cell.textLabel?.sizeToFit() // 文字数に合わせて縦に伸びます。
        cell.textLabel?.textColor = UIColor.blue
        //cell.textLabel?.textAlignment = .center // text内　横軸中央揃え

        //文字を設定したセルを返す
        return cell
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

