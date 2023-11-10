//
//  CollectionViewController.swift
//  NewsAPI
//
//  Created by Dev on 21/09/2022.
//

import Foundation
import UIKit
import SDWebImage


class CollectionViewController: UICollectionViewController {
    
    let customCellIdentifier = "MyCollectionCell"
    
    let newsManager = NewsManager()

    @IBOutlet var collectionGridView: UICollectionView!
    
    var collectionArray = [Articles]()
    
    var urlString: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupCollectionLayout()
        
        newsManager.fetchAPIData() { data, error in
            if let dataFetched = data as? News {
                self.collectionArray = dataFetched.articles
                DispatchQueue.main.async {
                    self.collectionGridView.reloadData()
                }
            }
        }
    }
    
    func setupCollectionLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 1.05), height: UIScreen.main.bounds.height / 2.20)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        collectionGridView.collectionViewLayout = layout
    }
    
    func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "NavBar")
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeb"{
            if let destination = segue.destination as? WebViewController{
                destination.urlString = urlString
            }
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        urlString = collectionArray[indexPath.row].url
        performSegue(withIdentifier: "goToWeb", sender: self)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! MyCollectionCell
        
        cell.newsImageView.sd_setImage(with: URL(string: collectionArray[indexPath.row].urlToImage))
        cell.stackView.addSubview(cell.newsImageView)
        
        cell.titleNameLabel.text = collectionArray[indexPath.row].title
        cell.stackView.addSubview(cell.titleNameLabel)
        
        cell.subtitleNameLabel.text = collectionArray[indexPath.row].description
        cell.stackView.addSubview(cell.subtitleNameLabel)
        
        cell.stackView.addSubview(cell.sourceHeading)
        
        cell.sourceNameLabel.text = collectionArray[indexPath.row].source.name
        cell.stackView.addSubview(cell.sourceNameLabel)
        
        cell.cellView.addSubview(cell.stackView)
        
        cell.addSubview(cell.cellView)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"

        let isoDate = collectionArray[indexPath.row].publishedAt

        if let date = dateFormatterGet.date(from: isoDate) {
            
            cell.dateValueLabel.text = dateFormatterPrint.string(from: date)
            cell.cellView.addSubview(cell.dateValueLabel)
            
            if let authorName = collectionArray[indexPath.row].author{
                cell.authorNameLabel.text = authorName
                cell.cellView.addSubview(cell.authorNameLabel)
            }
            
        } else {
           print("There was an error decoding the string")
        }
        
        return cell
    }
}
