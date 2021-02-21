//
//  PDFViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 20/2/21.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    public var documentData: Data?

    override func viewDidLoad() {
        super.viewDidLoad()

        let pdfView = PDFView()

        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        if let data = documentData {
          pdfView.document = PDFDocument(data: data)
          pdfView.autoScales = true
        }
        
        //pdfView.document = document
        
        let pdfData = createPDF()
        
        pdfView.document = PDFDocument(data: pdfData)
        pdfView.autoScales = true
        
        let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
        let pdfNameFromUrl = "NasaApi - myPdf.pdf"
        let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
        do {
            try pdfData.write(to: actualPath, options: .atomic)
            print("pdf successfully saved!")
        } catch {
            print("Pdf could not be saved")
        }
    }
    

    func createPDF() -> Data {
      // 1
      let pdfMetaData = [
        kCGPDFContextCreator: "NasaAPI Builder",
        kCGPDFContextAuthor: "Manuel",
        kCGPDFContextOwnerPassword: "myPassword123",
        kCGPDFContextTitle: "Lorem Ipsum",
      ]
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]

      // 2
      let pageWidth = 8.5 * 72.0
      let pageHeight = 11 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

      // 3
      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
      // 4
      let data = renderer.pdfData { (context) in
        // 5
        context.beginPage()
        // 6
        let attribHead = [
          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40)
        ]
        let attributes = [
          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ]
//        let cart = "Cartridge: \(detailPart?.catridge ?? "")\nComputer: \(detailPart?.computer ?? "") \n Part Number: \(detailPart?.partNum ?? "")"
        
        let headIng = "Nasa API Details"
        headIng.draw(at: CGPoint(x: 70, y: 0), withAttributes: attribHead)
        let text = "111111111"
        text.draw(at: CGPoint(x: 10, y: 100), withAttributes: attributes)
      }

      return data
    }

}
