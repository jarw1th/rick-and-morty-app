//
//  DetailCharacterViewController.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import UIKit

// Final class representing the detail view for a character.
final class DetailCharacterViewController: UIViewController {
    
    // ViewModel for managing character data.
    private var viewModel: DetailCharacterViewModelProtocol?

    // UI Components
    private let stackView = UIStackView()               // Stack view to arrange labels and image vertically
    private let nameLabel = UILabel()                    // Label for the character's name
    private let previewImage = UIImageView()             // Image view to display the character's image
    private let genderLabel = UILabel()                   // Label for the character's gender
    private let speciesLabel = UILabel()                  // Label for the character's species
    private let statusLabel = UILabel()                   // Label for the character's status
    private let originLabel = UILabel()                   // Label for the character's origin
    private let locationLabel = UILabel()                 // Label for the character's location
    
    // Convenience initializer to create the view controller with a character
    convenience init(character: Character) {
        self.init() // Call the designated initializer
        viewModel = DetailCharacterViewModel(character: character) // Initialize the ViewModel with the character
    }
    
    // Lifecycle method called after the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // Setup the user interface
    }
    
    // Private method to configure the UI components
    private func setupUI() {
        view.backgroundColor = .white // Set the background color of the view to white
        
        // Configure stack view layout and constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView) // Add stack view to the main view
        
        // Set up constraints for the stack view
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
        
        // Add UI components to the stack view
        [previewImage, nameLabel, genderLabel, speciesLabel, statusLabel, originLabel, locationLabel].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false // Disable autoresizing mask for constraints
            stackView.addArrangedSubview($0) // Add each label and image view to the stack view
        })
        
        // Configure stack view properties
        stackView.axis = .vertical // Arrange subviews vertically
        stackView.alignment = .center // Center align the subviews
        stackView.spacing = 16 // Set spacing between the subviews
        
        // Populate the UI components with data from the ViewModel
        previewImage.image = UIImage(data: viewModel?.image ?? Data()) // Set the character image
        nameLabel.text = viewModel?.name // Set the character's name
        genderLabel.text = viewModel?.gender // Set the character's gender
        speciesLabel.text = viewModel?.species // Set the character's species
        statusLabel.text = viewModel?.status // Set the character's status
        originLabel.text = viewModel?.origin // Set the character's origin
        locationLabel.text = viewModel?.location // Set the character's location
    }
    
}
