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

public class Account {

    private int aId;
    private String aUsername;
    private String aPassword;
    private String aDisplayName;
    private String aAddress;
    private String aEmail;
    private String aPhone;
    private int isSell;
    private int isAdmin;

    public Account() {
    }

    public Account(int aId, String aUsername, String aPassword, String aDisplayName, String aAddress, String aEmail, String aPhone, int isSell, int isAdmin) {
        this.aId = aId;
        this.aUsername = aUsername;
        this.aPassword = aPassword;
        this.aDisplayName = aDisplayName;
        this.aAddress = aAddress;
        this.aEmail = aEmail;
        this.aPhone = aPhone;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername;
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword;
    }

    public String getaDisplayName() {
        return aDisplayName;
    }

    public void setaDisplayName(String aDisplayName) {
        this.aDisplayName = aDisplayName;
    }

    public String getaAddress() {
        return aAddress;
    }

    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public String getaPhone() {
        return aPhone;
    }

    public void setaPhone(String aPhone) {
        this.aPhone = aPhone;
    }

    
}
