<%-- 
    Document   : ecluir_produtos
    Created on : 17 de set. de 2024, 09:31:16
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Declarar as variàveis
            Connection conecta;
            PreparedStatement st;
            String i;
            //Receber o id digitado no formulario
            i = request.getParameter("id");
            //Conectar no banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");//aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/campeonato", "root", "hoshimachisuisei");
            //Excluir o produto da tabela do banco de dados
            st = conecta.prepareStatement("DELETE from jogadores WHERE id=?");
            st.setString(1, i);
            int status = st.executeUpdate();//Executa o DELETE na tabela do BD
            if (status ==1){
               out.print("Poduto excluido com sucesso");
            }else{
               out.print("Produto não encontrado");
            }
        %>        
    </body>
</html>
