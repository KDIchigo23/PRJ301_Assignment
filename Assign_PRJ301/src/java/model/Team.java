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
public class Team {
    private int tId;
    private String tName;
    private int gId;

    public Team() {
    }

    public Team(int tId, String tName, int gId) {
        this.tId = tId;
        this.tName = tName;
        this.gId = gId;
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

    public int getgId() {
        return gId;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    @Override
    public String toString() {
        return "Team{" + "tId=" + tId + ", tName=" + tName + ", gId=" + gId + '}';
    }
    
    
}
