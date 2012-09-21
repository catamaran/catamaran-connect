<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
<div id="bodyContent">
	
	<p>
		${person.name}<br/>
		${person.email1}<br/>
		<#if person.email2??>
			${person.email2}<br/>
		</#if>
		<#if person.email3??>
			${person.email3}<br/>
		</#if>
		<#if person.phone1??>
			${person.phone1}<br/>
		</#if>
		<#if person.phone2??>
			${person.phone2}<br/>
		</#if>
		<#if person.phone3??>
			${person.phone3}<br/>
		</#if>
		<#if person.phone4??>
			${person.phone4}<br/>
		</#if>
		
		<#if person.nextCallDate??>
			${person.nextCallDate}<br/>
		<#else>
			Next call date not set.<br/>
		</#if>
	</p>
	
	<ul>
		<li><a href="${person.id?c}/edit">edit</a></li>
	</ul>
	<ul>
		<#list dateAlternativeKeys as alternative>
		<li>
			<form action="<@spring.url '/persons/set-call-date' />" method="POST">
				<input type="hidden" id="id" name="id" value="${person.id}" />
				<input type="hidden" id="nextCallDate" name="nextCallDate" value="${dateAlternativeValues[alternative]?date}" />
				<input type="submit" value="${alternative}" />
			</form>
		</li>
		</#list>
	</ul>
	
</div> <!-- bodyContent -->
</body>
</html>