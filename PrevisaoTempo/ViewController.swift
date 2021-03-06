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
        
        layout.itemSize = CGSize(
            width: (self.view.frame.width*0.90-40)/3,
            height: 160.0
        )
        
        // definindo espaco entre linhas dos itens da collection
        layout.minimumLineSpacing = 20
        
        // definindo espaco entre colunas dos itens da collection
        //layout.minimumInteritemSpacing = 20
        
        previsaoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        previsaoCollection.delegate = self
        previsaoCollection.dataSource = self
        
        previsaoCollection.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "celula")
        
        // registrando uma celula customizada
        
        // cria uma referencia para o arquixo xib (tem gente que fala zib)
        let nibCelula = UINib(nibName: "CelulaCustomizada", bundle: nil)
        
        // registra a celula customizada
        previsaoCollection.register(nibCelula,
                                    forCellWithReuseIdentifier: "CelulaCustomizada")
        
        // adicionado a collectionView na tela
        self.view.addSubview(previsaoCollection)
        
        previsaoCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            previsaoCollection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            previsaoCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            previsaoCollection.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            previsaoCollection.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.90)
            // largura da collection vai ser 90% da tela porque ele faz o c??clulo (largura_lista = largura_lista * 0.90)
            
//            previsaoCollection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            previsaoCollection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

/// UICollectionView tamb??m vai ter ses m??todos de Delegate e DataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// N??mero de itens na se????o
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    /// Vai passar qual c??lula vai entrar no espaco de cada item da colecao
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "celula", for: indexPath)
            cell.contentView.backgroundColor = .systemPink
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CelulaCustomizada",
                for: indexPath
            )
            
            guard let celulaCustomizada = cell as? CelulaCustomizada else {
                // melhor forma de tratar na verdade ?? ter um tipo padr??o para aparecer caso nao seja poss??vel fazer o dequeue
                return UICollectionViewCell()
            }
            
            celulaCustomizada.labelTitle.text = "\(indexPath.row)"
            return celulaCustomizada
            
//            guard let cell: CelulaCustomizada = collectionView.dequeueReusableCell(
//                withReuseIdentifier: "CelulaCustomizada",
//                for: indexPath
//            ) as? CelulaCustomizada else {
//                // melhor forma de tratar na verdade ?? ter um tipo padr??o para aparecer caso nao seja poss??vel fazer o dequeue
//                return UICollectionViewCell()
//            }
//            cell.labelTitle.text = "Test :)"
//            return cell
        }
    }
    
}
