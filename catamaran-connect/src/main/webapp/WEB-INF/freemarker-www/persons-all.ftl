<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.css" />
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.js"></script>
	
<head>
	<#include "includes/head.ftl" />
</head>
<body>
<div id="bodyContent">
	
	<div data-role="page">
		<div data-role="header">
			<h1>People</h1>
		</div>
		
	<ul data-role="listview" data-inset="true" data-filter="true">
	<#list persons as person>
		<li><a href="${person.id}">${person.displayName!"N/A"}</a></li>
	</#list>
	</ul>
	
</div> <!-- bodyContent -->
</body>
</html>