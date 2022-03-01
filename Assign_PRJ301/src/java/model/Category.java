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
public class Category {
    private int ctId;
    private String ctName;

    public Category() {
    }

    public Category(int ctId, String ctName) {
        this.ctId = ctId;
        this.ctName = ctName;
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
        return "Category{" + "ctId=" + ctId + ", ctName=" + ctName + '}';
    }
    
    
}
