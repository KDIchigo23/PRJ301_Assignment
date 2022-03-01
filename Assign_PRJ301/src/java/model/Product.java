/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Product {

    private int proId;
    private int pId;
    private String proName;
    private String pName;
    private String prDescription;
    private int proQuantity;
    private float proPrice;
    private String proImg_url;
    private int ctId;
    private String ctName;

    public Product() {
    }

    public Product(int proId, int pId, String proName, String pName, String prDescription, int proQuantity, float proPrice, String proImg_url, int ctId, String ctName) {
        this.proId = proId;
        this.pId = pId;
        this.proName = proName;
        this.pName = pName;
        this.prDescription = prDescription;
        this.proQuantity = proQuantity;
        this.proPrice = proPrice;
        this.proImg_url = proImg_url;
        this.ctId = ctId;
        this.ctName = ctName;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
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

    public String getProImg_url() {
        return proImg_url;
    }

    public void setProImg_url(String proImg_url) {
        this.proImg_url = proImg_url;
    }

    public int getCtId() {
        return ctId;
    }

    public void setCtId(int ctId) {
        this.ctId = ctId;
    }

    public String getCtName() {
        return ctName;
    }

    public void setCtName(String ctName) {
        this.ctName = ctName;
    }

    @Override
    public String toString() {
        return "Product{" + "proId=" + proId + ", pId=" + pId + ", proName=" + proName + ", pName=" + pName + ", prDescription=" + prDescription + ", proQuantity=" + proQuantity + ", proPrice=" + proPrice + ", proImg_url=" + proImg_url + ", ctId=" + ctId + ", ctName=" + ctName + '}';
    }

    
}
