package org.catamarancode.connect.service;

import java.io.Serializable;
import java.util.Map;

import javax.persistence.Transient;

import org.catamarancode.connect.entity.User;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * A bean that represents a wrapper around a User object stored in a session
 * @author mkvalsvik
 *
 */
@Component
@Scope("session")
public class UserContext implements Serializable {
	
	private static final String USER_MODEL_KEY = "user";

	private static final long serialVersionUID = 1L;
	
	private Long userId;
	
	public void prepareModel(Map<String, Object> model) {
		User user = this.getUser();
		model.put(USER_MODEL_KEY, user);
	}
	
	@Transient
	public User getUser() {
		User user = User.objects.load(getUserId());
		return user;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public boolean isLoggedIn() {
		if (this.userId != null) {
			return true;
		}
		return false;
	}

}
