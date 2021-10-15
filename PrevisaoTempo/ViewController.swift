//
//  ViewController.swift
//  PrevisaoTempo
//
//  Created by Rayana Prata Neves on 15/10/21.
//

import UIKit

class ViewController: UIViewController {

    var previsaoCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // o layout vai definir alguns aspectos de como a collection vai ser apresentada na tela
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100.0, height: 160.0)
        
        previsaoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        previsaoCollection.delegate = self
        previsaoCollection.dataSource = self
        
        previsaoCollection.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "celula")
        
        self.view.addSubview(previsaoCollection)
        
        previsaoCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            previsaoCollection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            previsaoCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            previsaoCollection.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            previsaoCollection.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.90)
            
//            previsaoCollection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            previsaoCollection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

/// UICollectionView também vai ter ses métodos de Delegate e DataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// Número de itens na seção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    /// Vai passar qual célula vai entrar no espaco de cada item da colecao
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celula", for: indexPath)
        cell.contentView.backgroundColor = .systemPink
        return cell
    }
    
}
