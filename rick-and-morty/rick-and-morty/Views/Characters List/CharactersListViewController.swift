//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import UIKit

// Final class that represents the list of characters, inheriting from UITableViewController
final class CharactersListViewController: UITableViewController {
    
    // ViewModel for managing character data
    private var viewModel: CharactersListViewModelProtocol? {
        didSet {
            // When the ViewModel is set, fetch characters and reload the table view
            viewModel?.getCharacters {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating() // Stop the activity indicator once data is loaded
                    self.tableView.reloadData() // Reload the table view data to display characters
                }
            }
        }
    }
    
    // Activity indicator for showing loading status
    private let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start animating the activity indicator to show loading state
        activityIndicator.startAnimating()
        viewModel = CharactersListViewModel() // Initialize the ViewModel
        
        setupUI() // Set up the user interface components
        
        // Register a default UITableViewCell for reuse in the table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    // Function to set up the UI components
    private func setupUI() {
        title = viewModel?.title // Set the view controller's title
        
        // Configure the activity indicator's constraints and position
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator) // Add the activity indicator to the view
        let centerY = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: 0) // Center Y constraint
        let centerX = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0) // Center X constraint
        view.addConstraints([centerY, centerX]) // Add constraints to the view
        
        activityIndicator.style = .large // Set the style of the activity indicator
    }

    // MARK: - TableView DataSource Methods

    // Returns the number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let number = viewModel?.numberOfSections else { return 0 } // Safely unwrap the number of sections
        return number // Return the number of sections
    }

    // Returns the number of rows in a given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let number = viewModel?.numberOfRows else { return 0 } // Safely unwrap the number of rows
        return number // Return the number of rows
    }
    
    // Returns the cell for a specific row in the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell for the given index path
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as UITableViewCell
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell") // Set cell style
        
        // Get the character data for the current index path
        viewModel?.getCharacter(for: indexPath, completion: { character in
            // Update the cell's text and image with character data
            cell.textLabel?.text = character.name // Set the character name
            cell.detailTextLabel?.text = character.gender // Set the character gender
            cell.imageView?.image = UIImage(data: character.image) // Set the character image
        })
        
        return cell // Return the configured cell
    }
    
    // Handles the selection of a row in the table view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected character and present its details
        viewModel?.getCharacter(for: indexPath, completion: { character in
            self.present(DetailCharacterViewController(character: character), animated: true) // Present the detail view controller
        })
    }
    
}
