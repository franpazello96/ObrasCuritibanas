//
//  Obra.swift
//  ObrasCuritibanas
//
//  Created by francielly pazello on 26/04/25.
//

import Foundation

struct ObraDeArte{
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}

let obrasMockadas: [ObraDeArte] = [
    ObraDeArte(titulo: "Horizontes Urbanos", artista: "Ana Souza", ano: 2010, estilo: "Contemporâneo", imagemNome: "obra1", descricao: "Obra que explora a interação entre luz e arquitetura nas grandes cidades."),
    ObraDeArte(titulo: "Caminho das Águas", artista: "Bruno Martins", ano: 2015, estilo: "Impressionismo", imagemNome: "obra2", descricao: "Uma celebração das cores e reflexos encontrados em rios e lagos."),
]
