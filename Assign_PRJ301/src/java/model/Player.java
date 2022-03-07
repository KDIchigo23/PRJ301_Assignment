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

public class Player {
    private int pId;
    private String pName;
    private String pDob;
    private String pPosition;
    private int pNo;
    private int tId;
    private String tName;
    private String pAchievement;
    private String pImg_url;

    public Player() {
    }

    public Player(int pId, String pName, String pDob, String pPosition, int pNo, int tId, String tName, String pAchievement, String pImg_url) {
        this.pId = pId;
        this.pName = pName;
        this.pDob = pDob;
        this.pPosition = pPosition;
        this.pNo = pNo;
        this.tId = tId;
        this.tName = tName;
        this.pAchievement = pAchievement;
        this.pImg_url = pImg_url;
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

    public String getpDob() {
        return pDob;
    }

    public void setpDob(String pDob) {
        this.pDob = pDob;
    }

    public String getpPosition() {
        return pPosition;
    }

    public void setpPosition(String pPosition) {
        this.pPosition = pPosition;
    }

    public int getpNo() {
        return pNo;
    }

    public void setpNo(int pNo) {
        this.pNo = pNo;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String getpAchievement() {
        return pAchievement;
    }

    public void setpAchievement(String pAchievement) {
        this.pAchievement = pAchievement;
    }

    public String getpImg_url() {
        return pImg_url;
    }

    public void setpImg_url(String pImg_url) {
        this.pImg_url = pImg_url;
    }

    
    
}
