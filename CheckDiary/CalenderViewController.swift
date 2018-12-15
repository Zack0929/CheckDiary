//
//  CalenderViewController.swift
//  CheckDiary
//
//  Created by 石黒隼 on 2018/12/01.
//  Copyright © 2018年 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet var zengetsuButton:UIButton!
    @IBOutlet var jigetsuButton:UIButton!
    @IBOutlet var myCollectionView:UICollectionView!
    
    let now = Date()
    var cal = Calendar.current
    let dateFormatter = DateFormatter()
    var components = DateComponents()

    override func viewDidLoad() {
        super.viewDidLoad()
        cal.locale = Locale(identifier: "ja")
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年M月"
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        calculation()
        //CollectionView =
        //ControllerView =
        //CalenderView =
        
     //   myCollectionView.delegate = self as! UICollectionViewDelegate
     //   myCollectionView.dataSource = self as! UICollectionViewDataSource
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        //        myCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

       
    }
    func calculation(){
        let firstDayOfMonth = cal.date(from: components)
        dateLabel.text = dateFormatter.string(from: firstDayOfMonth!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 37
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
        //weekdayAdding: 1日が何曜日かで変わるindexPath.rowに加える値
        let weekdayAdding = 2 - firstWeekday
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        let daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)?.count
        //1日〜月末まで表示し、余ったCellは空白にする
        if (indexPath.row + weekdayAdding) >= 1 && (indexPath.row + weekdayAdding) <= daysCountInMonth! {
            cell.backgroundColor = #colorLiteral(red: 0.9332516193, green: 0.9333856702, blue: 0.9332222342, alpha: 1)
            let label = UILabel()
            label.font = UIFont(name: "Arial", size: 17)
            label.text = "\(indexPath.row + weekdayAdding)"
            label.sizeToFit()
            label.center = cell.contentView.center
            cell.contentView.addSubview(label)
        } else {
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let myBoundSize: CGFloat = UIScreen.main.bounds.size.width
        let cellSize : CGFloat = myBoundSize / 5.7
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //cellが選択された場合
    func collectionView(_ collectionView:UICollectionView,didSelectItemAt indexPath:IndexPath){
        //[indexPath.row]から画像を探し、UIImageを設定
        //  selectedImage = UIImage(named: photos[IndexPath.row])
        //if selectedImage != nil {
            //SubViewControllerへ推移するためにSegueを呼び出す
            performSegue(withIdentifier: "toTodayViewController", sender: nil)
        //}
    }
    
    //Segue準備
    override func prepare(for segue: UIStoryboardSegue, sender:Any!){
        if(segue.identifier == "toTodayViewcontroller"){
            //let tVC: TodayViewController = (segue.destination as? TodayViewController)!
            
            //TodayViewControllerのselectedImgに選択された画像を設定する
            //  tVC.selectedImg = selectedImage
        }
    }
    
    //<前月 を押した時のAction
    @IBAction func myActionZengetsu(){
        components.month = components.month! - 1
        calculation()
        myCollectionView.reloadData()
    }
    
    //次月> を押した時のAction
    @IBAction func myActionJigetsu(){
        components.month = components.month! + 1
        calculation()
        myCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


