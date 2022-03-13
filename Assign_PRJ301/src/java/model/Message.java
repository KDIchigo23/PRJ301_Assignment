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
    private String mNote;

    public Message() {
    }

    public Message(int mId, int aId, String mNote) {
        this.mId = mId;
        this.aId = aId;
        this.mNote = mNote;
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

    public String getmNote() {
        return mNote;
    }

    public void setmNote(String mNote) {
        this.mNote = mNote;
    }
    
    
}
