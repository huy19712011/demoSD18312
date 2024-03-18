package org.example.demosd18312.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // fetch form data
        Part part = request.getPart("file");
        String submittedFileName = part.getSubmittedFileName();

//        String path = getServletContext().getRealPath("/" + "images" + File.separator + submittedFileName);
        String originPath = getServletContext().getRealPath(".");
        //int index = originPath.indexOf("target");
        String path = originPath.substring(0, originPath.indexOf("target")) + "src\\main\\webapp\\images\\" + submittedFileName;

//        String path = "D:\\Projects\\Java\\Poly\\demoSD18312\\src\\main\\webapp\\images\\" + submittedFileName;

        InputStream inputStream = part.getInputStream();
        boolean isUploaded = uploadFile(inputStream, path);
        if (isUploaded) {
            out.println("File uploaded to directory: " + path);
            out.println(getServletContext().getRealPath(".")); // originPath
        } else {
            out.println("Error...");
        }

    }

    private boolean uploadFile(InputStream inputStream, String path) {

        boolean isDone = false;
        try {

            byte[] bytes = new byte[inputStream.available()];
            inputStream.read();
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();

            isDone = true;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return isDone;
    }
}