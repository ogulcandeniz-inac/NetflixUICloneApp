//
//  ViewController.swift
//  NetflixUICloneApp_v2
//
//  Created by Oğulcan Deniz İnaç on 16.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tagsStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var catStackView: UIStackView!

    @IBOutlet weak var catBtn: UIButton!
    @IBOutlet weak var filmlerBtn: UIButton!
    @IBOutlet weak var DizilerBtn: UIButton!
    var filmlerListesi = [Filmler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let f1 = Filmler(resim: "suits")
        let f2 = Filmler(resim: "twe")
        let f3 = Filmler(resim: "peaky")
        let f4 = Filmler(resim: "thehatefuleight")
        let f5 = Filmler(resim: "thepianist")
        let f6 = Filmler(resim: "anadoluda")
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
        
        initialSetup()
        
        
        imageView.layer.cornerRadius = 20
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: 7, height: 7)
        imageView.layer.shadowRadius = 5.0
        imageView.layer.masksToBounds = false
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        DizilerBtn.layer.borderColor = UIColor.gray.cgColor
        DizilerBtn.layer.borderWidth = 1
        DizilerBtn.translatesAutoresizingMaskIntoConstraints = false
        DizilerBtn.layer.cornerRadius = 17
        DizilerBtn.titleLabel?.font = .systemFont(ofSize: 10)

        
        catBtn.layer.borderColor = UIColor.gray.cgColor
        catBtn.layer.borderWidth = 1
        catBtn.translatesAutoresizingMaskIntoConstraints = false
        catBtn.layer.cornerRadius = 17
        catBtn.titleLabel?.font = .systemFont(ofSize: 10)
        
        filmlerBtn.layer.borderColor = UIColor.gray.cgColor
        filmlerBtn.layer.borderWidth = 1
        filmlerBtn.translatesAutoresizingMaskIntoConstraints = false
        filmlerBtn.layer.cornerRadius = 17
        filmlerBtn.titleLabel?.font = .systemFont(ofSize: 10)

       

        
        
        
        
//        for view in catStackView.arrangedSubviews {
//            view.layer.cornerRadius = 10
//            view.layer.borderWidth = 1
//            view.layer.borderColor = UIColor.gray.cgColor
//            view.layer.bounds.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
//
//        }
    }
    
    
    
    func initialSetup(){
        view.backgroundColor = .black
        let gradientLayer = CAGradientLayer()
        

        gradientLayer.colors = [UIColor.black.cgColor, UIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0).cgColor]

        gradientLayer.locations = [0.5, 0.7]
            
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.3,y: 0.7)
            
            gradientLayer.frame = view.frame
            
            view.layer.insertSublayer(gradientLayer, at: 0)
        

        
        
        
        
    }
    
    
    
    
}



extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let film = filmlerListesi[indexPath.row]
        
        cell.imageCellCollectionViewCellImage.image = UIImage(named: film.resim!)
        cell.imageCellCollectionViewCellImage.layer.cornerRadius = 10

        
        
        return cell
    }
    
    
    
}
