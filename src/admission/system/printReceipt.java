package admission.system;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.FontSelector;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class printReceipt1
 */
@WebServlet("/printReceipt")
public class printReceipt extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public static int student_id;
	String name;
	String mobile,dateOfAdmission,email,course;
	Connection conn=DBmanager.getConnection();
	
    public printReceipt()
    {
        super();
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  Document document = new Document();	//create new document
		  response.setContentType("application/pdf");	//set response type to pdf
		  try
		  {
				PdfWriter.getInstance(document, response.getOutputStream());	//directly generate the pdf as response
			    document.open();		//opened document for writing
				Paragraph preface = new Paragraph("------Receipt------ "); //new paragraph
				preface.setLeading(50);//vertical space
				preface.setAlignment(Element.ALIGN_CENTER);
				document.add(preface);//add paragraph to document
				document.add(createTable());//add table to document
				document.close();
		  }
		  catch(DocumentException e)
		  {
				e.printStackTrace();
		  }
	}
	
	public PdfPTable createTable()
	{
		CallableStatement statement;
		try 
		{
			statement = conn.prepareCall("{CALL getdata(?)}");
			statement.setInt(1, student_id);
			statement.execute();
			ResultSet rs =statement.getResultSet();
			while(rs.next())
			{
				name=rs.getString(1)+" "+rs.getString(2);
				course=rs.getString(3);
				dateOfAdmission=rs.getString(4);
				mobile=rs.getString(6);
				email=rs.getString(7);
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	// a table with 5 number of columns
        PdfPTable table = new PdfPTable(5);
        // the cell object
        PdfPCell cell;
        table.setWidthPercentage(60);
        FontSelector selector = new FontSelector();
        Font f1 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 20);
        //select new font as TIMES ROMAN
        selector.addFont(f1);
       
        Phrase title=selector.process("College of Engineering\n----------------- ");
        title.setLeading(100);
        cell = new PdfPCell(title);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setFixedHeight(72f);
        cell.setColspan(5);
        table.addCell(cell);
        
        //create new paragraph and add to each cell
        Paragraph p = new Paragraph(20,"Name:"+name+"                Student ID.-:"+student_id);
        p.setIndentationLeft(25);
        cell.addElement(p);
        
        p = new Paragraph(30,"Contact Number:   "+mobile);
        p.setIndentationLeft(25);
        cell.addElement(p);
        p = new Paragraph(30,"Email:     "+email);
        p.setIndentationLeft(25);
        cell.addElement(p);
        p = new Paragraph(30,"Enrolled Course:   "+course);
        p.setIndentationLeft(25);
        cell.addElement(p);
        p = new Paragraph(30,"Fee:  100000/- paid");
        p.setIndentationLeft(25);
        cell.addElement(p);
        p=new Paragraph(70,"--------------------------------------------------------------------");
        p.setIndentationLeft(20);
        cell.addElement(p);
        p=new Paragraph(7,"--------------------------------------------------------------------");
        p.setIndentationLeft(20);
        cell.addElement(p);
        p=new Paragraph(30,"Date                                      Receivers Signature");
        p.setIndentationLeft(25);
        cell.addElement(p);
        cell.setFixedHeight(350f);
        table.addCell(cell);
        return table;
    }
}
