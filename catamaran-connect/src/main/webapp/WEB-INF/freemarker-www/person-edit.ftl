<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
<div id="bodyContent">
	
	<#if person??>
		<@spring.bind "person" />
	</#if>
	<#if spring.status??>	
		<!-- see http://code.google.com/p/itime-all/source/browse/trunk/inspector-time/src/main/webapp/WEB-INF/freemarker/www/inspector-time-macros.ftl -->
		<!-- see http://static.springsource.org/spring/docs/3.1.x/javadoc-api/org/springframework/web/servlet/support/BindStatus.html -->
		<!-- see http://static.springsource.org/spring/docs/3.1.x/javadoc-api/org/springframework/validation/Errors.html -->
		<#-- list spring.status.errorMessages as error> <b>${error}</b> <br> </#list -->
		
		<#list spring.status.errors.fieldErrors as fieldError>
	            Field ${fieldError.field}: <@spring.message fieldError /><br/>
	        </#list>
	        <#list spring.status.errors.globalErrors as error>
	            <@spring.message error /><br/>
	        </#list>
	</#if>
	
	<form action="<@spring.url '/persons/save' />" method="post">
		<@spring.formHiddenInput "person.id" />
		<div>			
	        <label for="firstName">First Name</label>
	        <@spring.formInput "person.firstName"/>
			<@spring.showErrors "<br/>"/>		        
		</div>
		<div>			
	        <label for="middleName">Middle Name</label>
	        <@spring.formInput "person.middleName"/>
			<@spring.showErrors "<br/>"/>		        
		</div>
		<div>			
	        <label for="lastName">Last Name</label>		        
	        <@spring.formInput "person.lastName"/>
			<@spring.showErrors "<br/>"/>
		</div>
		<div>
	        <label for="phone">Phone</label>
	        <@spring.formInput "person.phone1"/>
			<@spring.showErrors "<br/>"/>		        
		</div>
		<div>
	        <label for="email1">Email</label>
	        <@spring.formInput "person.email1"/>
			<@spring.showErrors "<br/>"/>		        
		</div>
		<div>
			<label for="button"></label>
			<input type="submit" value="Save" />
		</div>		
		
	</form>
	
</div> <!-- bodyContent -->
</body>
</html>