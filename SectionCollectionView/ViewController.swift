//
//  ViewController.swift
//  SectionCollectionView
//
//  Created by Ümit Örs on 21.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cv: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cv.delegate = self
        cv.dataSource = self
        
        
        cv.threeColumns()
        
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
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[section].sectionChild.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = list[indexPath.section].sectionChild[indexPath.item].childString
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "cell", for: indexPath) as! CollectionReusableView
        cell.labelR.text = list[indexPath.section].headerString
        return cell
    }

    
    
}
