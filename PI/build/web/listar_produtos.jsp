<%-- 
    Document   : listar
    Created on : 3 de set. de 2024, 11:11:28
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="tabelas.css">
    </head>
    <body>
        <%
            /*Declaração de variaveis*/
            Connection conecta;
            PreparedStatement st;
            ResultSet resultado;
            /* Conectar com o banco de dados...*/
            Class.forName("com.mysql.cj.jdbc.Driver");//aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/campeonato", "root", "hoshimachisuisei");
            /*verificar se o produto com o id informado está na tabela do banco de dados*/
            st = conecta.prepareStatement("SELECT * FROM jogadores");
            resultado = st.executeQuery();//Executa o Select e armazena os dados do usuário
            /* percorre a variavel resultado exibindo ca linha do produto*/
            out.print("<table>");
            out.print("<caption>Relatorio de produtos</caption>");
            out.print("<tr><th> ID </th><th> Nome </th><th> Altura </th><th> Clube </th><th> Exclusão </th><th> Alteração </th></tr>");
            while (resultado.next()){
            out.print("<tr><td>" + resultado.getString("id") + "</td><td>" + resultado.getString("nome") + "</td><td>" + resultado.getDouble("altura") + "</td><td>" + resultado.getString("clube")+"</td>");
            out.print("<td> <a href=excluir_produtos.jsp?id=" + resultado.getString("id") + "> Excluir </a> </td>");
            out.print("<td> <a href=carregar_produto.jsp?id=" + resultado.getString("id") + "> Alterar </a> </td></tr>");
            }
            out.print("</table>");

            %>
    </body>
</html>
