<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Utils.MysqlDBConexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>


<%@include file="detallePedidoTienda.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <body>
        <%
            Connection con = null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/marketplace","root","");
            out.print("Conexion en Linea");
            }catch(Exception ex){
            out.print("Error: "+ex.getMessage());
            }
            
            File reportfile = new File(application.getRealPath("Reporte/recibo.jasper"));

            Map<String, Object> parameter = new HashMap<String, Object>();
            String valor = request.getParameter("txtparametro");
            parameter.put("idPedido",new String(valor));

            String total = request.getParameter("total");
            parameter.put("parameter1",new String(total));
            
            String titulo = request.getParameter("titulo");
            parameter.put("titulo",new String(titulo));
            //GUARDAMOS EL REPORTE
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);//MOSTRAR PDF
            // SALIDA FORMATO PDF
            response.setContentType("application/pdf");
            
            response.setContentLength(bytes.length);
            //SALIDA PARA EL REPORTE PDF
            ServletOutputStream outputstream = response.getOutputStream();
            //DIBUJA EL REPORTE
            outputstream.write(bytes,0,bytes.length);
            
            JasperReport jasperReport;
            JasperPrint jasperPrint;                
            try
            {
              //se carga el reporte
              jasperReport=(JasperReport)JRLoader.loadObject(reportfile);
              //se procesa el archivo jasper
              jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, con);
              //se crea el archivo PDF
              JasperExportManager.exportReportToPdfFile(jasperPrint, "D:/reporte.pdf");
              
            }
            catch (JRException ex)
            {
              System.err.println( "Error iReport: " + ex.getMessage() );
            }
            //LIMPIA Y CIERRA
            outputstream.flush();
            outputstream.close();
            
            String correo ="ediczon.mayta@gmail.com";
            String contra="usfptazwtimsvgfl";

            String correoDestino= request.getParameter("correoDestino");;

            Properties p = new Properties();
            // Nombre del host de correo, es smtp.gmail.com
            p.put("mail.smtp.host", "smtp.gmail.com");
            // TLS si está disponible
            p.setProperty("mail.smtp.starttls.enable", "true");
            
            p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            // Puerto de gmail para envio de correos
            p.setProperty("mail.smtp.port", "587");
            // Nombre del usuario
            p.setProperty("mail.smtp.user",correo);
            p.setProperty("mail.smtp.auth", "true");
            //obtener nuestra instancia de Session.
            Session s = Session.getDefaultInstance(p);
            BodyPart texto = new MimeBodyPart();
            texto.setText("Recibo de Compra");
            BodyPart adjunto = new MimeBodyPart();

            adjunto.setDataHandler(new DataHandler(new FileDataSource("D:/reporte.pdf")));
            adjunto.setFileName("reporte.pdf");
            MimeMultipart m = new MimeMultipart();
            m.addBodyPart(texto);
            m.addBodyPart(adjunto);
            //    
            MimeMessage mensaje = new MimeMessage(s);
            // Quien envia el correo
            mensaje.setFrom(new InternetAddress(correo));
            // A quien va dirigido
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(correoDestino));

            String tienda = request.getParameter("tienda");

            mensaje.setSubject(tienda);
            mensaje.setContent(m);

            Transport t = s.getTransport("smtp");
            //ESTABLECEMOS LA CONEXION, dado de usuario y pass
            t.connect(correo,contra);
            //enviamos el mesaje
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();
            System.out.println("Mensaje enviado");
        %>
    </body>
</html>
