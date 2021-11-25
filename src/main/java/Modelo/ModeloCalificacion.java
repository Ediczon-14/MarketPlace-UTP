/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Entidad.Calificacion;
import Utils.MysqlDBConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edicz
 */
public class ModeloCalificacion {
    
    public int insertarCalificacion(Calificacion obj)
    {
	int salida = -1;
		
	Connection conn= null;
	PreparedStatement pstm = null;
	try 
        {
            conn = MysqlDBConexion.getConexion();
            String sql ="insert into calificacion values(null,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, obj.getCalificacion());
            pstm.setString(2, obj.getComentario());
            pstm.setString(3, obj.getFechaCalificacion());
            pstm.setInt(4, obj.getIdUsuario());
            pstm.setInt(5, obj.getIdTienda());
                        
            salida = pstm.executeUpdate();
			
        } catch (Exception e)
        {
            e.printStackTrace();
	}
        finally
        {
            try {
                    if(pstm!= null) pstm.close();
                    if(conn!= null) conn.close();
                } catch (Exception e2) 
                {}
        }
        return salida;
    }
    
    public List<Calificacion> listarCalificacion()
    {   Calificacion alu=null;
        List<Calificacion> data=new ArrayList<Calificacion>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from calificacion";
            pstm=cn.prepareStatement(sql);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Calificacion();
                alu.setIdCalificacion(rs.getInt("idCalificacion"));
                alu.setCalificacion(rs.getInt("calificacion"));
                alu.setComentario(rs.getString("comentario"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
}
