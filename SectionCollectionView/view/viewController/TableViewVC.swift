//
//  TableViewVC.swift
//  SectionCollectionView
//
//  Created by Ümit Örs on 21.12.2023.
//

import UIKit

class TableViewVC: UIViewController {
    @IBOutlet weak var tb: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tb.delegate = self
        tb.dataSource = self
        
        tb.estimatedRowHeight = 100
        tb.rowHeight = UITableView.automaticDimension
        
        getFunction()
    }
    var list : [sectionModel] = []
    var listChild : [sectionChildModel] = []
    func getFunction(){
        
        listChild.removeAll(keepingCapacity: false)
        listChild.append(sectionChildModel(childString: "Volvo"))
        listChild.append(sectionChildModel(childString: "Mercedes"))
        listChild.append(sectionChildModel(childString: "Renault"))
        listChild.append(sectionChildModel(childString: "Ford"))
        
        self.list.append(sectionModel(headerString: "Car", sectionChild: listChild))
        
        
        listChild.removeAll(keepingCapacity: false)
        listChild.append(sectionChildModel(childString: "White"))
        listChild.append(sectionChildModel(childString: "Red"))
        listChild.append(sectionChildModel(childString: "Black"))
        listChild.append(sectionChildModel(childString: "Yellow"))
        listChild.append(sectionChildModel(childString: "Pink"))
        
        self.list.append(sectionModel(headerString: "Color", sectionChild: listChild))
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension TableViewVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].sectionChild.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = list[indexPath.section].sectionChild[indexPath.item]
        cell.labelT.text = item.childString
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: "TbNib", bundle: nil)
        let headerView = nib.instantiate(withOwner: nil, options: nil).first as? UIView
        
        if let customHeaderView = headerView as? TbNibView {
            if let label = customHeaderView.labelNib {
                label.text = list[section].headerString
                label.textColor = UIColor.red
            }
        }
        return headerView
    }
    //Custom header Progmatically
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor.lightGray // Başlık arkaplan rengi
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 10, width: tableView.frame.width - 30, height: 30))
        titleLabel.text = list[section].headerString
        titleLabel.textColor = UIColor.black // Başlık metin rengi
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18) // Başlık fontu
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }*/
    /* //Yerleşik
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].headerString
    }*/
    
    /*
    //Opsionel Yerleşik Section Header View renk vs değişimi
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = .cyan
    }
    */
    
}
