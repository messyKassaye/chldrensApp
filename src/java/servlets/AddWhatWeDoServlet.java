/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ORM.ChildrenProfiles;
import ORM.Childrens;
import ORM.Covers;
import ORM.WhatWeDos;
import helpers.AgeCalculator;
import helpers.FilePaths;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Children;
import models.ChildrenProfile;
import models.Cover;
import models.WhatWeDo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author meseret
 */
@WebServlet(name = "AddWhatWeDo", urlPatterns = {"/AddWhatWeDoServlet"})
public class AddWhatWeDoServlet extends HttpServlet {

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
        File file = null;
        Connection connection = (Connection) getServletContext().getAttribute("DbConnection");
        WhatWeDos db = new WhatWeDos(connection);
        WhatWeDo children = new WhatWeDo();
        FileItem imageFileItem = null;
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(request);
            Iterator fileItemsIterator = fileItemsList.iterator();
            while (fileItemsIterator.hasNext()) {

                FileItem fileItem = (FileItem) fileItemsIterator.next();
                if (fileItem.isFormField()) {
                    String fieldName = fileItem.getFieldName();
                    String fieldValue = fileItem.getString();
                    if (fieldName.equals("title")) {
                        children.setTitle(fieldValue);
                    } else if (fieldName.equals("subTitle")) {
                        children.setSubTitle(fieldValue);
                    } else if (fieldName.equals("editor")) {
                        children.setDescription(fieldValue);
                    }
                } else {
                    imageFileItem = fileItem;
                    Calendar ca = Calendar.getInstance();
                    Date salt = ca.getTime();
                    file = new File(FilePaths.IMAGE_PATH + File.separator + salt.toString() + fileItem.getName());
                }

            }
            int result = db.create(children, response);
            if (result > 0) {
                Covers covers = new Covers(connection);
                Cover cover = new Cover(0, String.valueOf(result), FilePaths.IMAGE_URL + file.getName());
                covers.create(cover, response);
                imageFileItem.write(file);
                HttpSession sess = request.getSession(false);
                sess.setAttribute("message", "Added Successfully");
                request.getRequestDispatcher("whatWeDo/add-what-we-do.jsp").forward(request, response);
            }

        } catch (FileUploadException e) {
            response.getWriter().print(e.getMessage());
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
