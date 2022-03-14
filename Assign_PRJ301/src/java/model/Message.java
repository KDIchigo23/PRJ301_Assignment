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

public class Message {

    private int mId;
    private int aId;
    private String aDisplayName;
    private String mMessage;
    private String mCreated_date;

    public Message() {
    }

    public Message(int mId, int aId, String aDisplayName, String mMessage, String mCreated_date) {
        this.mId = mId;
        this.aId = aId;
        this.aDisplayName = aDisplayName;
        this.mMessage = mMessage;
        this.mCreated_date = mCreated_date;
    }

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
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

    public String getmMessage() {
        return mMessage;
    }

    public void setmMessage(String mMessage) {
        this.mMessage = mMessage;
    }

    public String getmCreated_date() {
        return mCreated_date;
    }

    public void setmCreated_date(String mCreated_date) {
        this.mCreated_date = mCreated_date;
    }

    
}
