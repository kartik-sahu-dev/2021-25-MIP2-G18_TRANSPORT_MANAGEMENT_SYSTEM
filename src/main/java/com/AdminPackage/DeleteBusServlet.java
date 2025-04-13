package com.AdminPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBusServlet")
public class DeleteBusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the bus ID to delete from the form
        String busIDToDelete = request.getParameter("busIDToDelete");

        // JDBC connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/busDB";
        String dbUser = "root";
        String dbPassword = "root";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            // Prepare the DELETE SQL statement for both tables
            String deleteBusNumberQuery = "DELETE FROM busnumber WHERE busID=?";
            String deleteStaffDetailsQuery = "DELETE FROM staffdetails WHERE ID=?";

            // Use a transaction to ensure both deletes succeed or fail together
            connection.setAutoCommit(false);

            try (PreparedStatement deleteBusNumberStatement = connection.prepareStatement(deleteBusNumberQuery);
                 PreparedStatement deleteStaffDetailsStatement = connection.prepareStatement(deleteStaffDetailsQuery)) {

                // Set parameters for both statements
                deleteBusNumberStatement.setString(1, busIDToDelete);
                deleteStaffDetailsStatement.setString(1, busIDToDelete);

                // Execute the DELETE statements
                deleteBusNumberStatement.executeUpdate();
                deleteStaffDetailsStatement.executeUpdate();

                // Commit the transaction
                connection.commit();
            } catch (Exception e) {
                // Rollback the transaction if there's an error
                connection.rollback();
                e.printStackTrace();
            } finally {
                // Set auto-commit back to true
                connection.setAutoCommit(true);
            }

            // Redirect back to the main page after deletion
            response.sendRedirect(request.getContextPath() + "/InsertBus.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
