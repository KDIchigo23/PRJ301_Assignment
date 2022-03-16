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

public class AllStar {

    private int apId;
    private String apName;
    private int apPTS;
    private String apRules;
    private String apPosition;
    private int apNo;
    private String tName;
    private String apImg_url;

    public AllStar() {
    }

    public AllStar(int apId, String apName, int apPTS, String apRules, String apPosition, int apNo, String tName, String apImg_url) {
        this.apId = apId;
        this.apName = apName;
        this.apPTS = apPTS;
        this.apRules = apRules;
        this.apPosition = apPosition;
        this.apNo = apNo;
        this.tName = tName;
        this.apImg_url = apImg_url;
    }

    public String getapPosition() {
        return apPosition;
    }

    public void setapPosition(String apPosition) {
        this.apPosition = apPosition;
    }

    public int getapNo() {
        return apNo;
    }

    public void setapNo(int apNo) {
        this.apNo = apNo;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    

 }
