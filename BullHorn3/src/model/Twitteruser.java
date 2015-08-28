package model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the TWITTERUSER database table.
 * 
 */
@Entity
@Table(name="TWITTERUSER",schema="testdb")
@NamedQuery(name="Twitteruser.findAll", query="SELECT t FROM Twitteruser t")
public class Twitteruser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="USER_ID")
	private long userId;

	@Temporal(TemporalType.DATE)
	@Column(name="JOIN_DATE")
	private Date joinDate;

	private String motto;

	private String name;

	//bi-directional many-to-one association to Twitterpost
	@OneToMany(mappedBy="twitteruser")
	private List<Twitterpost> twitterposts;

	public Twitteruser() {
	}

	public long getUserId() {
		return this.userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public Date getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getMotto() {
		return this.motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Twitterpost> getTwitterposts() {
		return this.twitterposts;
	}

	public void setTwitterposts(List<Twitterpost> twitterposts) {
		this.twitterposts = twitterposts;
	}

	public Twitterpost addTwitterpost(Twitterpost twitterpost) {
		getTwitterposts().add(twitterpost);
		twitterpost.setTwitteruser(this);

		return twitterpost;
	}

	public Twitterpost removeTwitterpost(Twitterpost twitterpost) {
		getTwitterposts().remove(twitterpost);
		twitterpost.setTwitteruser(null);

		return twitterpost;
	}

}