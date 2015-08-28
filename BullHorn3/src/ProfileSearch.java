

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;
import model.Twitterpost;
import model.Twitteruser;

/**
 * Servlet implementation class ProfileSearch
 */
@WebServlet("/ProfileSearch")
public class ProfileSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
     String message="";  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		message="";
		String name=request.getParameter("UserName");
		EntityManager em=DBUtil.getEmFactory().createEntityManager();
		String q="select t from Twitteruser t where t.name='"+name+"'";	
		String q1="";
		TypedQuery<Twitteruser>bq =em.createQuery(q,Twitteruser.class);
		List<Twitteruser> list=bq.getResultList();		
		message+="<div class=\"container\">"+
		  "<div class=\"jumbotron\">"+
		    "<h1>User Profile</h1> "+    
		    "<p>Please find the profile information below...</p> "+     
		 "</div>";
		message+="<div align=\"center\">";
		for(Twitteruser temp:list){
			message+="<h4>User ID: "+temp.getUserId()+"</h4><h4>Name:"+temp.getName()+"</h4><h4>Motto: "+temp.getMotto()+"</h4><h4>Date Of Join: "+temp.getJoinDate()+"</h4>";
			q1="select p from Twitterpost p where p.twitteruser.userId="+temp.getUserId()+" order by p.postId desc";
		}
		TypedQuery<Twitterpost>cq =em.createQuery(q1,Twitterpost.class);
		List<Twitterpost> list1=cq.getResultList();	
		
		if(list1==null || list1.isEmpty())
			message+="You hven't posted yet!";
		else{
			message+="<div class=\"container\">"+
					  "<div class=\"jumbotron\">"+
					    "<h1>Post Stream</h1> "+    
					    "<p>Please find your current posts below...</p> "+     
					 "</div>";
		 message+="<div align=\"center\"><table style=\"border:2px solid black\">";
            message+="<th style=\" background-color:white;border:2px solid black\">User Name</th><th style=\" background-color:white;border:2px solid black\">Post</th>";
		for(Twitterpost temp:list1){
			 message+="<tr ><td style=\" background-color:white;border:2px solid black\">"+
	                  "<a href=\"ProfileSearch?UserName=" +temp.getTwitteruser().getName() + "\">"+temp.getTwitteruser().getName()+"</a>"+
	               		   "</td><td style=\" background-color:white;border:2px solid black\">"+temp.getPost()+			               		
	               		  "</td></tr>" ;  
			//message+="User Name: "+temp.getTwitteruser().getName()+"  Post: "+temp.getPost()+"<br>";
			 }
		  message+="\n</tbody>\n</table></div>";
		}
		
		request.setAttribute("message", message);						
		getServletContext().getRequestDispatcher("/Search.jsp").forward(request, response);
	}

}
