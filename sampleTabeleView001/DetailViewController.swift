//
//  DetailViewController.swift
//  sampleTabeleView001
//
//  Created by 小林由知 on 2017/11/03.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    var teaList = [
        "ダージリン"
        , "アッサム"
        , "オレンジペコ"
        , "ねこにゃー"
    ]
    
    var descriptionList = [
        "CV：喜多村英梨\n学年：3年\n担当：隊長・戦車長\n身長：158cm\n出身地：神奈川県横浜市\n現住所：聖グロリアーナ女学院女子寮\n家族構成：父、母、妹\n血液型：AB型\n誕生日：9月17日\n年齢：17歳\n好きな食べ物：ミートパイ\n好きなお菓子：カスタードプリン\n好きな飲み物：ダージリンティー\n好きな花：青いバラ（奇跡）\n好きな戦車：センチュリオン\n得意科目：英語\n趣味：紅茶\n日課：名言集を読む\n座右の銘：行いの美しいものは、姿も麗しい"
        , "CV：明坂聡美\n学年：3年\n担当：砲手\n身長：150cm\n出身：神奈川県横浜市\n 現住所：聖グロリアーナ女学院女子寮\n家族構成：父、母、兄\n血液型：０型\n誕生日：12月8日\n年齢：17歳\n好きな食べ物：ローストビーフ\n好きなお菓子：ジンジャーナッツ\n好きな飲み物：アッサム\n好きな花：ミニバラ（無意識の美）\n好きな戦車：チャレンジャー\n得意科目：数学\n苦手科目：漢文\n趣味：紅茶\n日課：ジョギング\n 座右の銘：道理は全てを支配する"
        , "CV：石原舞\n学年：1年\n担当：装填手兼通信手\n身長：144cm\n出身地：神奈川県横浜市\n現住所：聖グロリアーナ女学院女子寮\n家族構成：父、母\n血液型：０型\n誕生日：7月10日\n年齢：16歳\n好きな食べ物：ホットクロスパン\n好きなお菓子：トライフル\n好きな飲み物：オレンジペコ\n好きな花：オレンジバラ（無邪気）\n好きな戦車：クルセイダ\n得意科目：英語\n苦手科目：数学\n趣味：紅茶\n日課：詩集を読む\n座右の銘：満足しない者は、何も持っていないのと同じ\n備考：操縦もうまく、また資料整理能力の高さから、ダージリンの補佐として抜擢"
        , "所属校：県立大洗女子学園\n学年：2年生\n所属チーム：アリクイさんチーム\n担当：チームリーダー・戦車長・通信手\n身長：168㎝\n出身地：茨城県鉾田市\n血液型：B型\n好きな食べ物：ポテトチップ\n好きな花：バラ\n好きな戦車：レオパルト2\nCV：葉山いくみ\n \nスラーダーを動かすとねこにゃーの素顔が見れるよ！\n　※画像のズレが解消できません。（画像サイズは同じ。myImageViweの前後のサイズ差を幅4pt、高さ4ptに設定済み。）※"
    ]

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myImageViwe: UIImageView!
    @IBOutlet weak var myImageViweBack: UIImageView!
    
    @IBOutlet weak var myTextView: UITextView!
    @IBAction func mySlider(_ sender: UISlider) {
        myImageViwe.alpha = CGFloat(sender.value)
    }
    @IBOutlet weak var mySlider: UISlider!
    
    func setThumbnailImage(image: UIImage?) {
        
        myImageViwe.image = image
        
        let constraint = NSLayoutConstraint(
            item: myImageViwe,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.equal,
            toItem: myImageViwe,
            attribute: NSLayoutAttribute.width,
            multiplier: (image?.size.height)! / (image?.size.width)!,
            constant:0)
        
        NSLayoutConstraint.activate([constraint])
    }
    
    // 受け取った行番号を保存しておく変数（箱）
    var passedIndex:Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("２枚目に表示されたよ。うふふ。")
        print("受け取った行番号\(passedIndex)")

        myLabel.text = teaList[passedIndex]
        myImageViwe.image = UIImage(named:"sample\(passedIndex).jpeg")
        
        if passedIndex == 3 {
            myImageViweBack.image = UIImage(named:"sample3_back.jpeg")
        }else{
            mySlider.isHidden = true
        }

        myTextView.text = descriptionList[passedIndex]
        myTextView.sizeToFit() // 文字数に合わせて縦に伸びます。

//        if passedIndex != 3 {
//            mySlider.isHidden = true
//        }
        // Do any additional setup after loading the view.
    }
    

//    myImageViwe.alpha = "\(sender.value)"
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
