//
//  BarHighlightedView.swift
//  FLCharts
//
//  Created by Francesco Leoni on 09/01/22.
//  Copyright © 2021 Francesco Leoni All rights reserved.
//

import UIKit

/// A simple highlighted view that displays the value of the currently highlighted chart bar.
public class BarHighlightedView: UIView, HighlightedView {
    
    public var dataValue: String?
    
    private let dataValueLabel = UILabel()
    private let unitOfMeasureLabel = UILabel()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 1)
        layer.cornerRadius = 5
        dataValueLabel.text = "0"
        dataValueLabel.textColor = .black
        dataValueLabel.textAlignment = .right
        dataValueLabel.font = .preferredFont(for: .subheadline, weight: .bold)
        dataValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        unitOfMeasureLabel.textColor = .lightGray
        unitOfMeasureLabel.textAlignment = .left
        unitOfMeasureLabel.font = .preferredFont(for: .footnote, weight: .medium)
        unitOfMeasureLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(dataValueLabel)
        NSLayoutConstraint.activate([
            dataValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dataValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dataValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        addSubview(unitOfMeasureLabel)
        NSLayoutConstraint.activate([
            unitOfMeasureLabel.leadingAnchor.constraint(equalTo: dataValueLabel.trailingAnchor, constant: 3),
            unitOfMeasureLabel.bottomAnchor.constraint(equalTo: dataValueLabel.bottomAnchor),
            unitOfMeasureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 10 + dataValueLabel.intrinsicContentSize.width + 5 + unitOfMeasureLabel.intrinsicContentSize.width + 10,
               height: 10 + dataValueLabel.intrinsicContentSize.height + 10)
    }
    
    public func update(with value: String?) {
        dataValueLabel.text = value
    }
    
    public func update(withChartData chartData: ChartData?) {
        unitOfMeasureLabel.text = chartData?.unitOfMeasure
    }
}
