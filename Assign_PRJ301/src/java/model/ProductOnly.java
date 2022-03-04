/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class ProductOnly {
    private int proId;
    private int pId;
    private String proName;
    private String proDescription;
    private int proQuantity;
    private float proPrice;
    private String proImg_url;
    private int ctId;

    public ProductOnly() {
    }

    public ProductOnly(int proId, int pId, String proName, String proDescription, int proQuantity, float proPrice, String proImg_url, int ctId) {
        this.proId = proId;
        this.pId = pId;
        this.proName = proName;
        this.proDescription = proDescription;
        this.proQuantity = proQuantity;
        this.proPrice = proPrice;
        this.proImg_url = proImg_url;
        this.ctId = ctId;
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

    public String getProDescription() {
        return proDescription;
    }

    public void setProDescription(String proDescription) {
        this.proDescription = proDescription;
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

    @Override
    public String toString() {
        return "ProductOnly{" + "proId=" + proId + ", pId=" + pId + ", proName=" + proName + ", proDescription=" + proDescription + ", proQuantity=" + proQuantity + ", proPrice=" + proPrice + ", proImg_url=" + proImg_url + ", ctId=" + ctId + '}';
    }

    
    
}
