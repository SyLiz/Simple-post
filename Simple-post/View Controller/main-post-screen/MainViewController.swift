//
//  ViewController.swift
//  Simple-post
//
//  Created by BOICOMP21070027 on 9/2/2565 BE.
//

import UIKit

protocol PostDelegate {
    func updateUI(index:Int)
    func popupAlert(data:Post,fromButton:String)
}

class MainViewController: UIViewController  {
    
    @IBOutlet weak var postTableView: UITableView!
    let tempUser1 = User(
        name: "Josee",
        imageUrl: "https://images.pexels.com/photos/1314550/pexels-photo-1314550.jpeg")
    let tempUser2 = User(
        name: "Tsuneo",
        imageUrl: "https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg")
    var postList:[Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postList.append(Post(user: tempUser1, time:  getCurrentTime(0), description: "その代表が1932年に来日したチンパンジーの「リタ」（愛称：リタ嬢）で、三輪車や竹馬に乗ったり、フォークとナイフを使って食事をするなどの芸を披露し、一躍人気者となった。しかし第二次世界大戦中には軍服やガスマスク姿などで戦意高揚の広告塔となり、同園でも空襲に備えた動物たちの殺処分（戦時猛獣処分）が行われた。これらの事をふまえ、現在同園では動物に芸を仕込むことは一切行っていない。", postImage: ["https://images.pexels.com/photos/3187036/pexels-photo-3187036.jpeg"]))
        postList.append(Post(user: tempUser2, time:  getCurrentTime(-60*6), description: "หนึ่งวันที่โอซาก้า แบบชิวๆ", postImage: ["https://images.pexels.com/photos/1440476/pexels-photo-1440476.jpeg"]))
        postList.append(Post(user: tempUser2, time:  getCurrentTime(5), description: "A coffeehouse, coffee shop, or café is an establishment that primarily serves coffee of various types, e.g. espresso, latte, and cappuccino. Some coffeehouses may serve cold drinks, such as iced coffee, iced tea, and other non-caffeinated beverages. In continental Europe, cafés serve alcoholic drinks. A coffeehouse may also serve food, such as light snacks, sandwiches, muffins, fruit, or pastries. Coffeehouses range from owner-operated small businesses to large multinational corporations. Some coffeehouse chains operate on a franchise business model, with numerous branches across various countries around the world.", postImage: ["https://images.pexels.com/photos/1070945/pexels-photo-1070945.jpeg"]))
        postList.append(Post(user: tempUser1, time:  getCurrentTime(-60*12), description: "Osaka Night Life", postImage: ["https://images.pexels.com/photos/1979828/pexels-photo-1979828.jpeg"]))
        
    
        postTableView.delegate = self
        postTableView.dataSource = self
    }
    
    func getCurrentTime(_ addminutes:Int) -> String {
        let date = Date()
        let addminutes = date.addingTimeInterval(TimeInterval(addminutes*60))
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: addminutes)
        return dateString
    }
    
    
}

extension MainViewController: PostDelegate {
    func updateUI(index: Int) {
        postTableView.reloadRows(at: [IndexPath(item: index, section: 0)], with: .none)
    }
    
    func popupAlert(data: Post, fromButton:String) {
        let alert = UIAlertController(title: "\(fromButton)", message: "\(data.description)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell")
        else {
            return UITableViewCell()
        }
        let buildcell = cell as! PostTableViewCell
        buildcell.delegate = self
        buildcell.viewModel = postList[indexPath.row]
        buildcell.postIndex = indexPath.row
        buildcell.setdate()
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

