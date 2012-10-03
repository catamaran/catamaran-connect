package org.catamarancode.connect.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.catamarancode.connect.entity.type.NoteType;
import org.catamarancode.entity.support.EntityFinder;
import org.catamarancode.entity.support.PersistableBase;
import org.catamarancode.util.Timestamped;

@Entity
public class Note extends PersistableBase implements Timestamped {
	
	public static EntityFinder objects;

	private String subject;
	private String body;
	private Person contact;
	private NoteType type;
	private Date createdTime;
    private Date lastModifiedTime;

	public NoteType getType() {
		return type;
	}

	public void setType(NoteType type) {
		this.type = type;
	}

	@ManyToOne(cascade = { CascadeType.ALL })
    public Person getContact() {
        return contact;
    }

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public void setContact(Person contact) {
		this.contact = contact;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLastModifiedTime() {
		return lastModifiedTime;
	}

	public void setLastModifiedTime(Date lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}
	
}
