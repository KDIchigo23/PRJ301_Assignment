/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Builder
@Getter
@Setter
@ToString

public class Product {
    private int proId;
    private int pId;
    private String proName;
    private String pName;
    private String proDescription;
    private int proQuantity;
    private float proPrice;
    private String proImg_url;
    private int ctId;
    private String ctName;

    public Product() {
    }

    public Product(int proId, int pId, String proName, String pName, String proDescription, int proQuantity, float proPrice, String proImg_url, int ctId, String ctName) {
        this.proId = proId;
        this.pId = pId;
        this.proName = proName;
        this.pName = pName;
        this.proDescription = proDescription;
        this.proQuantity = proQuantity;
        this.proPrice = proPrice;
        this.proImg_url = proImg_url;
        this.ctId = ctId;
        this.ctName = ctName;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    

    
}
