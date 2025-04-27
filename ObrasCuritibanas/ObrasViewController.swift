//
//  ObrasViewController.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 27/04/25.
//

import Foundation
import UIKit

class ObrasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
// dados
    var obras: [ObraDeArte] = obrasMockadas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        // Registrar o nib da célula personalizada
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }

    // itens na coleção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }

    // configuração da célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let obra = obras[indexPath.item]
        cell.configure(with: obra)
        return cell
    }

    // ação ao selecionar uma célula
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obraSelecionada = obras[indexPath.item]
        performSegue(withIdentifier: "mostrarDetalhesObra", sender: obraSelecionada)
    }

    // prepara a transição para a tela de detalhes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarDetalhesObra",
           let detalhesVC = segue.destination as? DetalhesObraViewController,
           let obra = sender as? ObraDeArte {
            detalhesVC.obra = obra
        }
    }
}
