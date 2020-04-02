/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domparserdemo;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author KienLT
 */
public class DOMParserDemo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new File("projects.xml"));
            Element root = doc.getDocumentElement();
            NodeList childOfRoot = root.getChildNodes();
            for (int i = 0; i < childOfRoot.getLength(); i++) {
                Node node = childOfRoot.item(i);
                if (node.getNodeType() == Document.ELEMENT_NODE
                        && node.getNodeName().equals("project")) {
                    NamedNodeMap attributes = node.getAttributes();
                    Node id = attributes.getNamedItem("id");
                    System.out.println("ID: " + id.getNodeValue());
                    NodeList childOfProject = node.getChildNodes();
                    for(int j = 0; j < childOfProject.getLength(); j++) {
                        Node n = childOfProject.item(j);
                        if (n.getNodeType() == Document.ELEMENT_NODE
                        && n.getNodeName().equals("name")) {
                            System.out.println(n.getTextContent());
                        }
                        if (n.getNodeType() == Document.ELEMENT_NODE
                        && n.getNodeName().equals("customer")) {
                            System.out.println(n.getTextContent());
                        }
                    }
                    
                    
                }
            }

        } catch (ParserConfigurationException ex) {
            Logger.getLogger(DOMParserDemo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(DOMParserDemo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DOMParserDemo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
