//
//  DetailCharacterViewController.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import UIKit

final class DetailCharacterViewController: UIViewController {
    private var viewModel: DetailCharacterViewModelProtocol?

    private let stackView = UIStackView()
    private let nameLabel = UILabel()
    private let previewImage = UIImageView()
    private let genderLabel = UILabel()
    private let speciesLabel = UILabel()
    private let statusLabel = UILabel()
    private let originLabel = UILabel()
    private let locationLabel = UILabel()
    
    convenience init(character: Character) {
        self.init()
        
        viewModel = DetailCharacterViewModel()
        viewModel?.setSelectedCharacter(character)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint(item: stackView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: stackView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -128).isActive = true
        NSLayoutConstraint(item: stackView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: stackView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        [previewImage, nameLabel,  genderLabel, speciesLabel, statusLabel, originLabel, locationLabel].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        })
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        
        previewImage.image = UIImage(data: viewModel?.image ?? Data())
        nameLabel.text = viewModel?.name
        genderLabel.text = viewModel?.gender
        speciesLabel.text = viewModel?.species
        statusLabel.text = viewModel?.status
        originLabel.text = viewModel?.origin
        locationLabel.text = viewModel?.location
    }
}


