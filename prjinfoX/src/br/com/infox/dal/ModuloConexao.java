package br.com.infox.dal;

import java.sql.*;

public class ModuloConexao {

    // Método responsável por estabelecer a conexão com o banco de dados

    public static Connection conector() {
        java.sql.Connection conexao = null;
        // Chamando o driver de conexão
        String driver = "com.mysql.jdbc.Driver";
        // Armazenando informações referentes ao banco
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "";
        // Estabelecendo a conexão com o banco de dados
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url,user,password);
            return conexao;
        } catch (Exception e) {
            // a linha abaixo serve de apoio para esclarecer o erro
            // System.out.println(e);
            return null;
        }
    }
}
