<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
<div id="bodyContent">

	<ul>
	<#list persons as person>
		<li>${person.lastName!"N/A"}, ${person.firstName!"N/A"} - ${person.email}</li>
	</#list>
	</ul>
	
</div> <!-- bodyContent -->
</body>
</html>