//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import UIKit

final class CharactersListViewController: UITableViewController {
    private var viewModel: CharactersListViewModelProtocol? {
        didSet {
            viewModel?.getCharacters {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        viewModel = CharactersListViewModel()
        
        setupUI()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    private func setupUI() {
        title = viewModel?.title
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        let centerY = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: 0)
        let centerX = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        view.addConstraints([centerY, centerX])
        
        activityIndicator.style = .large
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let number = viewModel?.numberOfSections else { return 0 }
        return number
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let number = viewModel?.numberOfRows else { return 0 }
        return number
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as UITableViewCell
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        
        viewModel?.getCharacter(for: indexPath, completion: { character in
            cell.textLabel?.text = character.name
            cell.detailTextLabel?.text = character.gender
            cell.imageView?.image = UIImage(data: character.image)
        })
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.getCharacter(for: indexPath, completion: { character in
            self.present(DetailCharacterViewController(character: character), animated: true)
        })
    }
}

