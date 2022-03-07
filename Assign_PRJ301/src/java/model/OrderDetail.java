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

public class OrderDetail {

    private int odId;
    private int oId;
    private String proName;
    private String proImg_url;
    private double proPrice;
    private int odQuantity;

    public OrderDetail() {
    }

    public OrderDetail(int odId, int oId, String proName, String proImg_url, double proPrice, int odQuantity) {
        this.odId = odId;
        this.oId = oId;
        this.proName = proName;
        this.proImg_url = proImg_url;
        this.proPrice = proPrice;
        this.odQuantity = odQuantity;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }
   
}
