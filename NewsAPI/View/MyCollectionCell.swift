//
//  MyCollectionCell.swift
//  NewsAPI
//
//  Created by Dev on 21/09/2022.
//

import UIKit

class MyCollectionCell: UICollectionViewCell {

    var yposition = CGFloat()
    var xposition = CGFloat()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.frame.origin.x = 0
        view.frame.origin.y = 0
        view.frame.size.width = stackView.frame.width
        view.frame.size.height = UIScreen.main.bounds.height / 2.20
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.1)
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var newsImageView: UIImageView = {
        let view = UIImageView()
        view.frame.origin.x = 0
        view.frame.origin.y = yposition
        view.frame.size.width = stackView.frame.width
        view.frame.size.height = UIScreen.main.bounds.height / 4
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        yposition += UIScreen.main.bounds.height / 4
        
        return view
    }()
    
    lazy var titleNameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame.origin.x = 5
        titleLabel.frame.origin.y = yposition
        titleLabel.frame.size.width = UIScreen.main.bounds.width - 30
        titleLabel.frame.size.height = CGFloat(60)
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.75
        
        yposition += CGFloat(60)
        
        return titleLabel
    }()

    lazy var subtitleNameLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.frame.origin.x = 5
        subtitleLabel.frame.origin.y = yposition
        subtitleLabel.frame.size.width = UIScreen.main.bounds.width - 30
        subtitleLabel.frame.size.height = CGFloat(60)
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = UIColor.black
        subtitleLabel.font.withSize(15)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.minimumScaleFactor = 0.9
        
        yposition += CGFloat(60)
        
        return subtitleLabel
    }()
    
    lazy var sourceNameLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        sourceLabel.frame.origin.x = xposition
        sourceLabel.frame.origin.y = yposition
        sourceLabel.frame.size.width = UIScreen.main.bounds.width
        sourceLabel.frame.size.height = CGFloat(40)
        sourceLabel.adjustsFontSizeToFitWidth = true
        sourceLabel.minimumScaleFactor = 0.75

        return sourceLabel
    }()
    
    lazy var sourceHeading: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.text = "Source:   "
        sourceLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        sourceLabel.frame.origin.x = 5
        sourceLabel.frame.origin.y = yposition
        sourceLabel.frame.size.width = CGFloat(60)
        sourceLabel.frame.size.height = CGFloat(40)
        sourceLabel.adjustsFontSizeToFitWidth = true
        sourceLabel.minimumScaleFactor = 0.75

        xposition += CGFloat(60)
        
        return sourceLabel
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.frame.origin.x = 0
        stack.frame.origin.y = 0
        stack.frame.size.width = UIScreen.main.bounds.width - 18
        stack.frame.size.height = CGFloat(100)
        stack.alignment = .fill
        stack.distribution = .fill
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()

    lazy var authorNameLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.frame.origin.x = newsImageView.frame.origin.x + 5
        authorLabel.frame.origin.y = Double(newsImageView.frame.size.height) - 30
        authorLabel.frame.size.width = CGFloat(200)
        authorLabel.frame.size.height = CGFloat(20)
        authorLabel.textAlignment = .left
        authorLabel.textColor = .white
        authorLabel.font.withSize(14)
        authorLabel.minimumScaleFactor = 0.5
        return authorLabel
    }()
    
    lazy var dateValueLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.frame.origin.x = Double(newsImageView.frame.size.width) - 10 - 90
        dateLabel.frame.origin.y = Double(newsImageView.frame.size.height) - 30
        dateLabel.frame.size.width = CGFloat(90)
        dateLabel.frame.size.height = CGFloat(20)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .black
        dateLabel.backgroundColor = .white
        dateLabel.font.withSize(12)
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.minimumScaleFactor = 0.5
        dateLabel.layer.cornerRadius = 5
        dateLabel.layer.masksToBounds = true
        return dateLabel
    }()
    
}
