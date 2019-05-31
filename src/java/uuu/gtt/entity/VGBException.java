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
public class VGBException extends Exception{

	private static final long serialVersionUID = 1L;

	public VGBException() {
    }

    public VGBException(String message) {
        super(message);
    }

    public VGBException(String message, Throwable cause) {
        super(message, cause);
    }
    
}
