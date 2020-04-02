/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package saxparserdemo;

import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author KienLT
 */
public class OrderHandler extends DefaultHandler {

    private List<Order> list;

    public OrderHandler() {
        list = new ArrayList<>();
    }

    public List<Order> getList() {
        return list;
    }
        
    private boolean atOrderDate = false;
    private boolean atContent = false;
    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        super.characters(ch, start, length); //To change body of generated methods, choose Tools | Templates.
        String s = new String(ch, start, length);
        if(atOrderDate) {
            System.out.println("Order date: " + s);
        }
        if(atContent) {
            System.out.println("Content: " + s);
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName); //To change body of generated methods, choose Tools | Templates.
        if(qName.equals("order_date")) {
           atOrderDate = false;
        }
        if(qName.equals("content")) {
           atContent = false;
        }
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        super.startElement(uri, localName, qName, attributes); //To change body of generated methods, choose Tools | Templates.
        if(qName.equals("order")) {
            System.out.println("Code: " + attributes.getValue("code"));
        }
        if(qName.equals("order_date")) {
           atOrderDate = true;
        }
        if(qName.equals("content")) {
           atContent = true;
        }
    }

    @Override
    public void endDocument() throws SAXException {
        super.endDocument(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void startDocument() throws SAXException {
        super.startDocument(); //To change body of generated methods, choose Tools | Templates.
    }
    
}
