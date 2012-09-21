package org.catamarancode.connect.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.catamarancode.connect.entity.type.NoteType;
import org.catamarancode.entity.support.EntityFinder;
import org.catamarancode.entity.support.PersistableBase;

@Entity
public class Note extends PersistableBase {
	
	public static EntityFinder objects;

	private String subject;
	private String body;
	private Person contact;
	private NoteType type;

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
	
}
