/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.entity;

/**
 *
 * @author Administrator
 */
public enum Status {
	
    NEW("新訂單"), 
    NOTIFY("已通知付款"),
    PAID("付款已入帳"), 
    SHIPPED("已出貨"), 
    ARRIVED("已到店"), 
    CHECKED("已簽收"), 
    COMPLETED("已完成");
    
    private final String description;

    private Status(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }    
    
}
