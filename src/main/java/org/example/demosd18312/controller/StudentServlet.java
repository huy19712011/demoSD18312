package org.example.demosd18312.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demosd18312.model.Student;
import org.example.demosd18312.service.StudentDataService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get data from service
        List<Student> students = StudentDataService.getAllStudents();
        // add data to request object
        request.setAttribute("studentList", students);
        // get dispatcher, forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/studentList.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}