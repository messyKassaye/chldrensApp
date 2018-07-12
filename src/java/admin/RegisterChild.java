/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import ORM.Childrens;
import ORM.ChildrenProfiles;
import helpers.AgeCalculator;
import helpers.FilePaths;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.Children;
import models.ChildrenProfile;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author meseret
 */
@WebServlet(name = "RegisterChild", urlPatterns = {"/RegisterChild"})
public class RegisterChild extends HttpServlet {

    private ServletFileUpload uploader = null;

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException("Content type is not multipart/form-data");
        }
        File file = null;
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        Childrens db=new Childrens(connection);
        Children children = new Children();
        FileItem imageFileItem=null;
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(request);
            Iterator fileItemsIterator = fileItemsList.iterator();
            while (fileItemsIterator.hasNext()) {

                FileItem fileItem = (FileItem) fileItemsIterator.next();
                if (fileItem.isFormField()) {
                    String fieldName = fileItem.getFieldName();
                    String fieldValue= fileItem.getString();
                    if (fieldName.equals("childFirstName")) {
                        children.setFirstName(fieldValue);
                    } else if (fieldName.equals("childLastName")) {
                        children.setLastName(fieldValue);
                    } else if (fieldName.equals("country")) {
                        children.setCountry(fieldValue);
                    } else if (fieldName.equals("gender")) {
                        children.setGender(fieldValue);
                    } else if (fieldName.equals("birthDate")) {
                        Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(fieldValue); 
                        children.setAge(String.valueOf(AgeCalculator.getAge(date1)));
                    } else if (fieldName.equals("livesWith")) {
                        children.setLivesWith(fieldValue);
                    } else if (fieldName.equals("speaks")) {
                        children.setSpeaks(fieldValue);
                    }
                } else {
                    imageFileItem=fileItem;
                    Calendar ca= Calendar.getInstance();
                    Date salt=ca.getTime();
                    file = new File(FilePaths.IMAGE_PATH+ File.separator + salt.toString()+fileItem.getName());
                }

            }
            int result=db.create(children, response);
            if(result>0){
                ChildrenProfiles coverDb=new ChildrenProfiles(connection);
                ChildrenProfile cover= new ChildrenProfile(result, FilePaths.IMAGE_URL+file.getName());
               int coverResult= coverDb.create(cover);
               imageFileItem.write(file);
                HttpSession sess=request.getSession(false);
                sess.setAttribute("message", "Child Registerd Successfully");
               response.sendRedirect("childrenRegistration");
            }
        } catch (FileUploadException e) {
            response.getWriter().print(e.getMessage());
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());

        }

//        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
//
//        String firstName = request.getParameter("childFirstName");
//        String lastname = request.getParameter("childLastName");
//        String country = request.getParameter("country");
//        String gender = request.getParameter("gender");
//        String birthDate = request.getParameter("birthDate");
//        String livesWith = request.getParameter("livesWith");
//        String speaks = request.getParameter("speaks");
//        response.getWriter().print(firstName);
//
////        Children child=new Children();
////        child.setFirstName(firstName);
////        child.setLastName(lastname);
////        child.setCountry(country);
////        child.setLivesWith(livesWith);
////        child.setSpeaks(speaks);
////        //child.setBirthDateString(birthDate);
////         Childrens childORM=new Childrens(connection);
////         childORM.create(child,response);
////        response.getWriter().print(firstName+","+lastname+","+country+","+gender+","+birthDate+","+livesWith+","+speaks);
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
