<%-- 
    Document   : consultar
    Created on : 3 de set. de 2024, 11:11:28
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*Declara��o de variaveis*/
            String i;
            Connection conecta;
            PreparedStatement st;
            ResultSet resultado;
            /* Receber o id digitado no formul�rio*/
            i = request.getParameter("id");
            /* Conectar com o banco de dados...*/
            Class.forName("com.mysql.cj.jdbc.Driver");//aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/campeonato", "root", "hoshimachisuisei");
            /*verificar se o produto com o id informado est� na tabela do banco de dados*/
            st = conecta.prepareStatement("SELECT * FROM jogadores WHERE id=?");
            st.setString(1, i);//coloca o conteudo da variavel i no Select
            resultado = st.executeQuery();//Executa o Select e armazena os dados do usu�rio
            /*Verifica se o id foi encontrado na tabela do Banco de daos*/
            if (resultado.next()) { //se foi encontrado
        %>
        <form method="post" action="atualizar_produtos.jsp">
            <p>
                <label for="i">ID</label>
                <input id="i" type="text" maxlength="50" size="50" name="id" value="<%= resultado.getString("id")%>" readonly>
            </p>
            <p>
                <label for="n">Nome</label>
                <input id="n" type="text" name="nome" maxlength="50" size="50" value="<%= resultado.getString("nome")%>" required>
            </p>
            <p>
                <label for="a">Altura</label>
                <input id="a" type="number" name="altura" min="0" step="0.01" value="<%= resultado.getDouble("altura")%>">
            </p>
            <p>
                <label for="c">Clube</label>
                <input id="c" type="text" name="clube" size="50" maxlength="50" value="<%= resultado.getString("clube")%>" required>
            </p>
            <p>
                <input type="submit" value="Salvar Altera��o">
            </p>
        </form>
        <%
            } else { //se n�o foi encontrado
                out.print("Produto n�o cadastrado");
            }

        %>
    </body>
</html>
