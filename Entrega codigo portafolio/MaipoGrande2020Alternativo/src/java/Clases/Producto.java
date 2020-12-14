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
public class Producto {
    
    private int idCompra;
     private String nomProducto;
     private int pesoProducto;
     private int precioProducto;
     private String EstadoProducto;
     private int rutProductor;

    public Producto(int idCompra, String nomProducto, int pesoProducto, int precioProducto, String EstadoProducto, int rutProductor) {
        this.idCompra = idCompra;
        this.nomProducto = nomProducto;
        this.pesoProducto = pesoProducto;
        this.precioProducto = precioProducto;
        this.EstadoProducto = EstadoProducto;
        this.rutProductor = rutProductor;
    }

    /**
     * @return the idCompra
     */
    public int getIdCompra() {
        return idCompra;
    }

    /**
     * @param idCompra the idCompra to set
     */
    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    /**
     * @return the nomProducto
     */
    public String getNomProducto() {
        return nomProducto;
    }

    /**
     * @param nomProducto the nomProducto to set
     */
    public void setNomProducto(String nomProducto) {
        this.nomProducto = nomProducto;
    }

    /**
     * @return the pesoProducto
     */
    public int getPesoProducto() {
        return pesoProducto;
    }

    /**
     * @param pesoProducto the pesoProducto to set
     */
    public void setPesoProducto(int pesoProducto) {
        this.pesoProducto = pesoProducto;
    }

    /**
     * @return the precioProducto
     */
    public int getPrecioProducto() {
        return precioProducto;
    }

    /**
     * @param precioProducto the precioProducto to set
     */
    public void setPrecioProducto(int precioProducto) {
        this.precioProducto = precioProducto;
    }

    /**
     * @return the EstadoProducto
     */
    public String getEstadoProducto() {
        return EstadoProducto;
    }

    /**
     * @param EstadoProducto the EstadoProducto to set
     */
    public void setEstadoProducto(String EstadoProducto) {
        this.EstadoProducto = EstadoProducto;
    }

    /**
     * @return the rutProductor
     */
    public int getRutProductor() {
        return rutProductor;
    }

    /**
     * @param rutProductor the rutProductor to set
     */
    public void setRutProductor(int rutProductor) {
        this.rutProductor = rutProductor;
    }

     

     
     
}
