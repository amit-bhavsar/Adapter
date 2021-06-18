//
//  Navigator.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 14/06/21.
//

import Foundation
import SwiftUI

protocol DestinationProtocol
{
    associatedtype Body : View
    @ViewBuilder var view: Self.Body { get }
}

protocol Navigator
{
    associatedtype DestinationType where DestinationType : DestinationProtocol
    associatedtype Body : View
    
    @ViewBuilder
    func bind(_ destination : DestinationType, with trigger: Binding<Bool>, isPresent: Bool) -> Self.Body
}

extension View
{
    func navigate<V>(_ view: V) -> some View where V : View {
        return NavigationLink(destination: view) {
            self
        }
    }
    
    
    func navigate<V>(_ destination: V) -> some View where V : DestinationProtocol {
        return NavigationLink(destination: destination.view) {
            self
        }
    }
    
    func present<V>(_ view: V, with trigger: Binding<Bool>) -> some View where V : View {
        self.fullScreenCover(isPresented: trigger) {
            view
        }
    }
}
