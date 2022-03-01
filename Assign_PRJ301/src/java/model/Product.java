/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Product {
    private int proId;
    private String proName;
    private String prDescription;
    private int proQuantity;
    private float proPrice;
    private int pId;
    private String pName;
    private String proImg_url;

    public Product() {
    }

    public Product(int proId, String proName, String prDescription, int proQuantity, float proPrice, int pId, String pName, String proImg_url) {
        this.proId = proId;
        this.proName = proName;
        this.prDescription = prDescription;
        this.proQuantity = proQuantity;
        this.proPrice = proPrice;
        this.pId = pId;
        this.pName = pName;
        this.proImg_url = proImg_url;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getPrDescription() {
        return prDescription;
    }

    public void setPrDescription(String prDescription) {
        this.prDescription = prDescription;
    }

    public int getProQuantity() {
        return proQuantity;
    }

    public void setProQuantity(int proQuantity) {
        this.proQuantity = proQuantity;
    }

    public float getProPrice() {
        return proPrice;
    }

    public void setProPrice(float proPrice) {
        this.proPrice = proPrice;
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

    public String getProImg_url() {
        return proImg_url;
    }

    public void setProImg_url(String proImg_url) {
        this.proImg_url = proImg_url;
    }

    @Override
    public String toString() {
        return "Product{" + "proId=" + proId + ", proName=" + proName + ", prDescription=" + prDescription + ", proQuantity=" + proQuantity + ", proPrice=" + proPrice + ", pId=" + pId + ", pName=" + pName + ", proImg_url=" + proImg_url + '}';
    }

    
    
}
