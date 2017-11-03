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
    var teaList = [
          "ダージリン"
        , "アッサム"
        , "オレンジペコ"
        , "ねこにゃー"
    ]
    
    
    // 何行目が選択されてら保存する変数
    // -1は、行番号が何も選択されたいない。という目印になる。
    var selectedIndex = -1
    
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
        cell.textLabel?.font = UIFont(name: "AmericanTypewriter", size: 16)
        cell.textLabel?.lineBreakMode = .byCharWrapping
        //byCharWrappingを変えれば、折り返しとかも可能。
        
        //cell.textLabel?.sizeToFit() // 文字数に合わせて縦に伸びます。
        cell.textLabel?.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        }else if indexPath.row % 2 == 1{
            cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        //cell.textLabel?.textAlignment = .center // text内　横軸中央揃え
        
        tableView.separatorColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)

        //文字を設定したセルを返す
        return cell
    }
    
    //セルがタップされたら発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)行目をタップしました。")
        
        // 選択された行番号を保存
        selectedIndex = indexPath.row
        
        //セグエの名前を指定して、画面　処理を発動
        performSegue(withIdentifier: "showDetail", sender: nil)
        
    }

    //セグエを使って、画面遷移をするときに発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 次の画面をインスタンス（オブジェクト）を取得
        //as! DetailViewControllerがダウンキャスト変換している箇所
        var dvc:DetailViewController = segue.destination as! DetailViewController
        
        // 次の画面をプロパティ（メンバ変数）passedIndexに選択された行番号を渡す。
        dvc.passedIndex = selectedIndex
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

