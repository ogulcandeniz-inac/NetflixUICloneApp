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
            setupFilmler()
            initialSetup()
            setupImageView()
            setupButtons()
            setupCollectionView()
        }
        
        func setupFilmler() {
            let f1 = Filmler(resim: "suits")
            let f2 = Filmler(resim: "twe")
            let f3 = Filmler(resim: "peaky")
            let f4 = Filmler(resim: "thehatefuleight")
            let f5 = Filmler(resim: "thepianist")
            let f6 = Filmler(resim: "anadoluda")
            
            filmlerListesi = [f1, f2, f3, f4, f5, f6]
        }
        
        func initialSetup() {
            view.backgroundColor = .black
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.black.cgColor, UIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0).cgColor]
            gradientLayer.locations = [0.5, 0.7]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.3, y: 0.7)
            gradientLayer.frame = view.frame
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        func setupImageView() {
            imageView.layer.cornerRadius = 20
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowOffset = CGSize(width: 7, height: 7)
            imageView.layer.shadowRadius = 5.0
            imageView.layer.masksToBounds = false
        }
        
        func setupButtons() {
            for button in [catBtn, filmlerBtn, DizilerBtn] {
                button?.layer.borderColor = UIColor.gray.cgColor
                button?.layer.borderWidth = 1
                button?.translatesAutoresizingMaskIntoConstraints = false
                button?.layer.cornerRadius = 17
                button?.titleLabel?.font = .systemFont(ofSize: 10)
            }
        }
        
        func setupCollectionView() {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
