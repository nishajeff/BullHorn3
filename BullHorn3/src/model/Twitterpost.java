package model;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the TWITTERPOST database table.
 * 
 */
@Entity
@Table(name="TwitterPost",schema="testdb")
@NamedQuery(name="Twitterpost.findAll", query="SELECT t FROM Twitterpost t")
public class Twitterpost implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="POST_ID")
	private long postId;

	private String post;

	//bi-directional many-to-one association to Twitteruser
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private Twitteruser twitteruser;

	public Twitterpost() {
	}

	public long getPostId() {
		return this.postId;
	}

	public void setPostId(long postId) {
		this.postId = postId;
	}

	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Twitteruser getTwitteruser() {
		return this.twitteruser;
	}

	public void setTwitteruser(Twitteruser twitteruser) {
		this.twitteruser = twitteruser;
	}

}