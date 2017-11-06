//
//  ViewController.swift
//  Localizacao do usuario
//
//  Created by Rodrigo Abreu on 06/11/17.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configurar bliblioteca - build phases - link bunary with libraries
        //adicionar CoreLocation
        gerenciadorLocal.delegate = self//a propria classe ficara reponsavel pelo objeto gerenciadorLocal
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest//configurar precisao
        gerenciadorLocal.requestWhenInUseAuthorization()//pedir autorizacao para o usuario
        gerenciadorLocal.startUpdatingLocation()//comeca atualizar a localizacao atual
        
        //configuracao adicional o Info.plist para autorizacao do usuario
        //Em "Required device capabilities" - add "location-services" e "gps"
        //Add "Privacy - Location When In Use Usage Description" e uma mensagem "Necessário acesso à sua localização para funcionamento do App!"
        
        
        
        
        
        /*        
        let latitude: CLLocationDegrees = -23.586974
        let longetude: CLLocationDegrees = -46.657355
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongetude: CLLocationDegrees = 0.01
        
        //configurar coordenadas 2D
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longetude)
        
        //configurar o zoom
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongetude)
        
        //configurar uma regiao para o mapa
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        //exibir regiao no mapa
        mapa.setRegion(regiao, animated: true)
        
        //configurar anotacao
        let anotacao = MKPointAnnotation()
        
        anotacao.coordinate = localizacao
        anotacao.title = "Parque do Ibirapuera"
        anotacao.subtitle = "O Parque Ibirapuera é o mais importante parque urbano da cidade de São Paulo, no Brasil."
        
        mapa.addAnnotation(anotacao)*/
        
        
        
        
        
        
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario: CLLocation = locations.last!//pegar ultima localizacao do usuario
        
        //monta exibicao do mapa
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longetude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongetude: CLLocationDegrees = 0.01
        
        //configurar coordenadas 2D
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longetude)
        
        //configurar o zoom
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongetude)
        
        //configurar uma regiao para o mapa
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        //exibir regiao no mapa
        mapa.setRegion(regiao, animated: true)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

