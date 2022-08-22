//
//  TransferViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/19/22.
//

import UIKit
typealias PeopleDataSource = UICollectionViewDiffableDataSource<Manager.Section, People>

class TransferViewController: UIViewController {
    
    @IBOutlet weak var paymentsTableVIew: UITableView!
    @IBOutlet weak var paymentsCollectionView: UICollectionView!
    @IBOutlet weak var quickSendCollectionView: UICollectionView!
    
    private var dataSource: PeopleDataSource!
    
    var theViewModels = [ItemsCollectionViewCellViewModel]()
    var items = [Items]()
    
    
    struct Service {
        let title: String
        let imageName: String
        let color: UIColor
    }
    
    let data: [Service] = [
        Service(title: "Electricity", imageName:"lightbulb.fill", color: UIColor(hexString: "FFD33D")!),
    Service(title: "Internet", imageName: "wifi", color: UIColor(hexString: "753EE7")!),
    Service(title: "Assurance", imageName: "pills.fill", color: UIColor(hexString: "F14142")!),
    Service(title: "Merchant", imageName: "cart.fill", color: UIColor(hexString: "50CD87")!),
    Service(title: "Mobile Sevices", imageName: "iphone", color: UIColor(hexString: "4C4EDC")!),
    Service(title: "Gosuslugi", imageName: "mail.stack", color: UIColor(hexString: "4C4EDC")!),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        paymentsTableVIew.delegate = self
        paymentsTableVIew.dataSource = self
        paymentsTableVIew.rowHeight = 60
        
        paymentsCollectionView.delegate = self
        paymentsCollectionView.dataSource = self
        
        
        quickSendCollectionView.delegate = self
        //MARK: - APICaller implemation
        APICaller.shared.fetchData { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                
                self?.theViewModels = items.compactMap({ItemsCollectionViewCellViewModel(description: $0.description, imageURL: $0.image)})
                
                DispatchQueue.main.async {
                    self?.paymentsCollectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupView() {
        
        quickSendCollectionView.collectionViewLayout = configureCollectionViewLayout()
        configureDataSource()
        configureSnapshot()
    }
    

}

extension TransferViewController {
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?
            
            switch sectionIndex {
            case 0:
                section = self.getPreviewSection()
                
            default:
                section = self.getPreviewSection()
            }
            return section
        
    }
        return UICollectionViewCompositionalLayout(sectionProvider:  sectionProvider)

    }
    
    private func getPreviewSection() -> NSCollectionLayoutSection? {
        //create item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.9))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //create section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = CGFloat(0.1)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
        return section
    }
}

// MARK: - Diffable Data Source -

extension TransferViewController {
    
    func configureDataSource() {
        dataSource = PeopleDataSource(collectionView: quickSendCollectionView) { (collectionView: UICollectionView, indexPath: IndexPath, people: People) -> UICollectionViewCell? in
            
            let reuseIdentifier: String
            
            switch indexPath.section {
            case 0: reuseIdentifier = TransferVCQuickCollectionViewCell.reuseIdentifier
            default:
                reuseIdentifier = TransferVCQuickCollectionViewCell.reuseIdentifier
            }
            
            guard let cell = self.quickSendCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as?  PeopleCell else {
                return nil
            }
            
            let section = Manager.Section.allCases[indexPath.section]
            
            cell.showPeople(people: Manager.people[section]?[indexPath.item])
            
            return cell
        }
    }
    
    
    func configureSnapshot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<Manager.Section, People> ()
        
        Manager.Section.allCases.forEach{ collection in
            currentSnapshot.appendSections([collection])
            if let people = Manager.people[collection] {
                currentSnapshot.appendItems(people)
            }
        }
        
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}

//MARK: - UITableView Delegate & Datasource Methods
extension TransferViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentsTableVIew.dequeueReusableCell(withIdentifier: K.TransferVCTableViewCell, for: indexPath) as! TransferTableViewCell
        
        let service = data[indexPath.row]
        cell.serviceName.text = service.title
        cell.serviceImage.image = UIImage(systemName: service.imageName)
        cell.serviceImage.tintColor = service.color
        
        return cell
    }
    
    
}

//MARK: - UICollectionView Delegate & Datasource Methods
extension TransferViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = paymentsCollectionView.dequeueReusableCell(withReuseIdentifier: K.TransferVCCollectionViewCell, for: indexPath) as! TransferCollectionViewCell
        cell.configure(with: theViewModels[indexPath.row])
        
        //MARK: - Just to make corners rounded and add shadow
        let cornerRadius: CGFloat = 5.0
        cell.contentView.layer.cornerRadius = cornerRadius
        cell.contentView.layer.masksToBounds = true;
        cell.layer.cornerRadius = cornerRadius
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.10
        cell.layer.masksToBounds = false;
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,cornerRadius: cornerRadius).cgPath
        
        return cell
    }
    
    
}
