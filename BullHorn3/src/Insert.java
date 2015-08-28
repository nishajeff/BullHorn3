



import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import model.DBUtil;
import model.Twitterpost;
import model.Twitteruser;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message="";
	String message1="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		message1="";
		String word=request.getParameter("word");
		if(!word.equalsIgnoreCase("")){
		EntityManager em=DBUtil.getEmFactory().createEntityManager();
		String q="select p from Twitterpost p  where upper(p.post) like upper('%"+word+"%')";
		TypedQuery<Twitterpost>bq =em.createQuery(q,Twitterpost.class);
		List<Twitterpost> list=bq.getResultList();
		if(list==null || list.isEmpty())
			message1+="<h3>Sorry.No such word exists in post stream!</h3>";
		else{
		message1+="  Search Results:<br> ";
		 message1+="<div align=\"center\"><table style=\"border:2px solid black\">";
         message1+="<th style=\" background-color:white;border:2px solid black\">User Name</th><th style=\" background-color:white;border:2px solid black\">Post</th>";
		for(Twitterpost temp:list){
			 message1+="<tr>"+
					 "<td style=\" background-color:white;border:2px solid black\">"+temp.getTwitteruser().getName()+		
	               		   "</td><td style=\" background-color:white;border:2px solid black\">"+temp.getPost()+			               		
	               		  "</td></tr>" ;  
		}
		}
		}
		else
			message1+="<h3>Please enter a word and try again!</h3>";
		request.setAttribute("message1", message1);
		getServletContext().getRequestDispatcher("/GetPost.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);		
			
		String currentpage=request.getParameter("currentpage");
		message="";
		try{
			
			//message+="<h3>List Of Posts Entered:</h3>";
			//String name=request.getParameter("name");
			if(currentpage.equalsIgnoreCase("EnterPost")){
				Twitteruser u = (Twitteruser) session.getAttribute("user");			
				String post=request.getParameter("post");			
				model.Twitterpost p=new model.Twitterpost();				
				p.setPost(post);			
				p.setTwitteruser(u);
				if(!post.equalsIgnoreCase(""))	
				model.DBUtil.insert(p);
				message+="Successfully Posted !Thank You.";
			}
			else if(currentpage.equalsIgnoreCase("GetPost")){
				EntityManager em=DBUtil.getEmFactory().createEntityManager();
				String q="select p from Twitterpost p order by p.postId desc";
				TypedQuery<Twitterpost>bq =em.createQuery(q,Twitterpost.class);
				List<Twitterpost> list=bq.getResultList();
				
				if(list==null || list.isEmpty())
					message+="Sorry.PostStream is empty!";
				else{
					message+="<div class=\"container\">"+
							  "<div class=\"jumbotron\">"+
							    "<h1>Post Stream</h1> "+    
							    "<p>Please find the current Newsfeed below...</p> "+     
							 "</div>";
				 message+="<div align=\"center\"><table style=\"border:2px solid black\">";
		            message+="<th style=\" background-color:white;border:2px solid black\">User Name</th><th style=\" background-color:white;border:2px solid black\">Post</th>";
				for(Twitterpost temp:list){
					 message+="<tr ><td style=\" background-color:white;border:2px solid black\">"+
			                  "<a href=\"ProfileSearch?UserName=" +temp.getTwitteruser().getName() + "\">"+temp.getTwitteruser().getName()+"</a>"+
			               		   "</td><td style=\" background-color:white;border:2px solid black\">"+temp.getPost()+			               		
			               		  "</td></tr>" ;  
					//message+="User Name: "+temp.getTwitteruser().getName()+"  Post: "+temp.getPost()+"<br>";
					 }
				  message+="\n</tbody>\n</table></div>";
				}
			}
			request.setAttribute("message", message);
			if(currentpage.equalsIgnoreCase("EnterPost"))				
    			getServletContext().getRequestDispatcher("/EnterPost.jsp").forward(request, response);
			else if(currentpage.equalsIgnoreCase("GetPost"))
				getServletContext().getRequestDispatcher("/GetPost.jsp").forward(request, response);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

}
