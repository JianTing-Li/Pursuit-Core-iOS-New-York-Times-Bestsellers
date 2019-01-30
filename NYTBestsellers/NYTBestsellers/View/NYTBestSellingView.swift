//
//  NYTBestSellingView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol NYTBestSellingViewDelegate: AnyObject {
    func setTitleOfPickerView(rowNum: Int) -> String
    func numberOfNYTBooks() -> Int
    func numberOfCategories() -> Int
    func configureUICollectionCell(indexPath: IndexPath) -> UICollectionViewCell
}

class NYTBestSellingView: UIView {
    
    weak var delegate: NYTBestSellingViewDelegate?
    
    lazy var bestsellersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 20)
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.dataSource = self
        cv.backgroundColor = .yellow
        return cv
    }()
    
    lazy var categoryPickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.delegate = self
        pv.dataSource = self
        pv.backgroundColor = .blue
        return pv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    

}

extension NYTBestSellingView {
    private func setupViews() {
        setupBestSellingCollectionView()
        setupCategoryPickerView()
    }
    
    private func setupBestSellingCollectionView() {
        addSubview(bestsellersCollectionView)
        bestsellersCollectionView.register(BookCell.self, forCellWithReuseIdentifier: "BookCell")
        
        bestsellersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bestsellersCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint.init(item: bestsellersCollectionView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 0.6, constant: 0).isActive = true
        bestsellersCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bestsellersCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    private func setupCategoryPickerView() {
        addSubview(categoryPickerView)
        categoryPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        categoryPickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        categoryPickerView.topAnchor.constraint(equalTo: bestsellersCollectionView.bottomAnchor, constant: 0).isActive = true
        categoryPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

extension NYTBestSellingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfNYTBooks() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = delegate?.configureUICollectionCell(indexPath: indexPath) else { return UICollectionViewCell() }
        return cell
    }
}

extension NYTBestSellingView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return delegate?.numberOfCategories() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return delegate?.setTitleOfPickerView(rowNum: row) ?? "Unknown"
    }
}
