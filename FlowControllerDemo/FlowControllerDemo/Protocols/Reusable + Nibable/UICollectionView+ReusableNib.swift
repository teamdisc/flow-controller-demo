//
//  UICollectionView+ReusableNib.swift
//  travelbook
//
//  Created by Pirush Prechathavanich on 9/10/17.
//
//

import UIKit

extension UICollectionView {
    
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Nibable {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
}

extension UICollectionViewCell: Reusable {}
