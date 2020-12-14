/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author inter
 */
public class Articulo {
    
    private int id_proceso;
    private int id_venta;
    private int rut_usuario;
    private String nombre_producto;
    private String calidad_producto;
    private int peso_producto;
    private int precio_producto;

    public Articulo(int id_proceso, int id_venta, int rut_usuario, String nombre_producto, String calidad_producto, int peso_producto, int precio_producto) {
        this.id_proceso = id_proceso;
        this.id_venta = id_venta;
        this.rut_usuario = rut_usuario;
        this.nombre_producto = nombre_producto;
        this.calidad_producto = calidad_producto;
        this.peso_producto = peso_producto;
        this.precio_producto = precio_producto;
    }

    /**
     * @return the id_proceso
     */
    public int getId_proceso() {
        return id_proceso;
    }

    /**
     * @param id_proceso the id_proceso to set
     */
    public void setId_proceso(int id_proceso) {
        this.id_proceso = id_proceso;
    }

    /**
     * @return the id_venta
     */
    public int getId_venta() {
        return id_venta;
    }

    /**
     * @param id_venta the id_venta to set
     */
    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    /**
     * @return the rut_usuario
     */
    public int getRut_usuario() {
        return rut_usuario;
    }

    /**
     * @param rut_usuario the rut_usuario to set
     */
    public void setRut_usuario(int rut_usuario) {
        this.rut_usuario = rut_usuario;
    }

    /**
     * @return the nombre_producto
     */
    public String getNombre_producto() {
        return nombre_producto;
    }

    /**
     * @param nombre_producto the nombre_producto to set
     */
    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    /**
     * @return the calidad_producto
     */
    public String getCalidad_producto() {
        return calidad_producto;
    }

    /**
     * @param calidad_producto the calidad_producto to set
     */
    public void setCalidad_producto(String calidad_producto) {
        this.calidad_producto = calidad_producto;
    }

    /**
     * @return the peso_producto
     */
    public int getPeso_producto() {
        return peso_producto;
    }

    /**
     * @param peso_producto the peso_producto to set
     */
    public void setPeso_producto(int peso_producto) {
        this.peso_producto = peso_producto;
    }

    /**
     * @return the precio_producto
     */
    public int getPrecio_producto() {
        return precio_producto;
    }

    /**
     * @param precio_producto the precio_producto to set
     */
    public void setPrecio_producto(int precio_producto) {
        this.precio_producto = precio_producto;
    }
    
    
    
    
}
