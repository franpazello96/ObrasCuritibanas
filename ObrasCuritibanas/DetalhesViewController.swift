//
//  DetalhesViewController.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 26/04/25.
//

import Foundation
import UIKit

class DetalhesObraViewController: UIViewController {
    
    @IBOutlet weak var imagemObra: UIImageView!
    @IBOutlet weak var tituloObra: UILabel!
    @IBOutlet weak var nomeArtista: UILabel!
    
    @IBOutlet weak var anoObra: UILabel!
    @IBOutlet weak var estiloObra: UILabel!
    @IBOutlet weak var descricaoObra: UILabel!
    
    @IBOutlet weak var compartilharButton: UIButton!
    @IBOutlet weak var voltarButton: UIButton!

    @IBAction func voltarButtonTapped(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func compartilharButtonTapped(_ sender: UIButton) {
        guard let obra = obra else { return }
        
        let title = obra.titulo
        let artistName = obra.artista
        
        let shareText = "\(title) por \(artistName). Venha conhecer mais artistas curitibanos!"
        
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    var obra: ObraDeArte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        // dados da obra
        if let obra = obra {
            imagemObra.image = UIImage(named: obra.imagemNome)
            tituloObra.text = obra.titulo
            nomeArtista.text = obra.artista
            anoObra.text = "\(obra.ano)"
            estiloObra.text = obra.estilo
            descricaoObra.text = obra.descricao
            descricaoObra.numberOfLines = 0
            descricaoObra.lineBreakMode = .byWordWrapping

        }
        configurarImagemObra()
        configurarLabelsEBotoes()
    }
    
    
    private func configurarImagemObra() {
        imagemObra.contentMode = .scaleAspectFill
        imagemObra.clipsToBounds = true
        imagemObra.translatesAutoresizingMaskIntoConstraints = false

        // remove constraints
        imagemObra.removeConstraints(imagemObra.constraints)
        
        // ajuste
        NSLayoutConstraint.activate([
            imagemObra.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imagemObra.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagemObra.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // proporção: Altura = x * largura
            imagemObra.heightAnchor.constraint(equalTo: imagemObra.widthAnchor, multiplier: 0.95)
        ])
    }
    
    private func configurarLabelsEBotoes() {
        //  Auto Layout
        tituloObra.translatesAutoresizingMaskIntoConstraints = false
        nomeArtista.translatesAutoresizingMaskIntoConstraints = false
        anoObra.translatesAutoresizingMaskIntoConstraints = false
        estiloObra.translatesAutoresizingMaskIntoConstraints = false
        descricaoObra.translatesAutoresizingMaskIntoConstraints = false
        compartilharButton.translatesAutoresizingMaskIntoConstraints = false
        voltarButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            //  logo abaixo da imagem
            tituloObra.topAnchor.constraint(equalTo: imagemObra.bottomAnchor, constant: 20),
            tituloObra.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tituloObra.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            //  artista abaixo do título
            nomeArtista.topAnchor.constraint(equalTo: tituloObra.bottomAnchor, constant: 8),
            nomeArtista.leadingAnchor.constraint(equalTo: tituloObra.leadingAnchor),
            nomeArtista.trailingAnchor.constraint(equalTo: tituloObra.trailingAnchor),
            
            //  obra abaixo do nome do artista
            anoObra.topAnchor.constraint(equalTo: nomeArtista.bottomAnchor, constant: 8),
            anoObra.leadingAnchor.constraint(equalTo: tituloObra.leadingAnchor),
            anoObra.trailingAnchor.constraint(equalTo: tituloObra.trailingAnchor),
            
            //  obra abaixo do ano
            estiloObra.topAnchor.constraint(equalTo: anoObra.bottomAnchor, constant: 8),
            estiloObra.leadingAnchor.constraint(equalTo: tituloObra.leadingAnchor),
            estiloObra.trailingAnchor.constraint(equalTo: tituloObra.trailingAnchor),

            // obra abaixo do estilo
            descricaoObra.topAnchor.constraint(equalTo: estiloObra.bottomAnchor, constant: 8),
            descricaoObra.leadingAnchor.constraint(equalTo: tituloObra.leadingAnchor),
            descricaoObra.trailingAnchor.constraint(equalTo: tituloObra.trailingAnchor),
            
            // abaixo da descrição
            compartilharButton.topAnchor.constraint(equalTo: descricaoObra.bottomAnchor, constant: 20),
            compartilharButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            compartilharButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            compartilharButton.heightAnchor.constraint(equalToConstant: 44),
            
            //  abaixo do botão
            voltarButton.topAnchor.constraint(equalTo: compartilharButton.bottomAnchor, constant: 12),
            voltarButton.leadingAnchor.constraint(equalTo: compartilharButton.leadingAnchor),
            voltarButton.trailingAnchor.constraint(equalTo: compartilharButton.trailingAnchor),
            voltarButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
  }
