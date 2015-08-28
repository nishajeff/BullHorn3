

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
import model.Twitteruser;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
   String message="" ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccount() {
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
		String name=request.getParameter("name");
		String motto=request.getParameter("motto");
		Twitteruser u=new Twitteruser();
		u.setName(name);
		u.setMotto(motto);
		model.DBUtil.insertUser(u);
		EntityManager em=DBUtil.getEmFactory().createEntityManager();
		String q="select t from Twitteruser t where t.name='"+name+"'";		
		TypedQuery<Twitteruser>bq =em.createQuery(q,Twitteruser.class);
		List<Twitteruser> list=bq.getResultList();		
		message+="<h3 align=\"center\">Account Created.Please login  to start tweeting.</h3>";
		message+="<div align=\"center\">";
		message+="<h4 >Your Account Information</h4>";
		System.out.println("message is:"+message);
		for(Twitteruser temp:list)
			message+="User ID: "+temp.getUserId()+"<br>Name:"+temp.getName()+"<br>Motto: "+temp.getMotto()+"<br>Date Of Join: "+temp.getJoinDate();
		message+="</div>";
		//System.out.println("message is:"+message);
		request.setAttribute("message", message);						
			getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
		}
		
	}


