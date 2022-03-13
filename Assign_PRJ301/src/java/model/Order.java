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

public class Order {
    
    private int oId;
    private int aId;
    private String aDisplayName;
    private double oTotalPrice;
    private String oNote;
    private String oCreated_date;
    private int sId;
    private String odProImg_url;
    private String odProName;
    private String odQuantity;

    public Order() {
    }

    public Order(int oId, int aId, String aDisplayName, double oTotalPrice, String oNote, String oCreated_date, int sId, String odProImg_url, String odProName, String odQuantity) {
        this.oId = oId;
        this.aId = aId;
        this.aDisplayName = aDisplayName;
        this.oTotalPrice = oTotalPrice;
        this.oNote = oNote;
        this.oCreated_date = oCreated_date;
        this.sId = sId;
        this.odProImg_url = odProImg_url;
        this.odProName = odProName;
        this.odQuantity = odQuantity;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getaDisplayName() {
        return aDisplayName;
    }

    public void setaDisplayName(String aDisplayName) {
        this.aDisplayName = aDisplayName;
    }

    public double getoTotalPrice() {
        return oTotalPrice;
    }

    public void setoTotalPrice(double oTotalPrice) {
        this.oTotalPrice = oTotalPrice;
    }

    public String getoNote() {
        return oNote;
    }

    public void setoNote(String oNote) {
        this.oNote = oNote;
    }

    public String getoCreated_date() {
        return oCreated_date;
    }

    public void setoCreated_date(String oCreated_date) {
        this.oCreated_date = oCreated_date;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    
    
    
}
