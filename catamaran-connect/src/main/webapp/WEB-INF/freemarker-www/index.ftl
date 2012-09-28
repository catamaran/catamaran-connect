<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
	<#include "includes/head.ftl" />
</head>
<body>
	
	<!--
	<div data-role="page">
		<div data-role="header">
			<h1>People</h1>
		</div>
		
		<ul data-role="listview" data-inset="true" data-filter="true">
		<#list persons as person>
			<li><a href="<@spring.url '/persons/${person.id?c}' />">${person.displayName!"N/A"} (${person.nextCallDate})</a></li>
		</#list>
		</ul>
	</div>
	-->
	
        <div data-role="page" id="page1">
        	<!-- black header at top
            <div data-theme="a" data-role="header">
                <h3>
                    Home
                </h3>
            </div>        	
           -->
            <div data-role="content" style="padding: 15px">
                <ul data-role="listview" data-inset="true">
                	
					<#list persons as person>
					<li>
						<a href="<@spring.url '/persons/${person.id?c}' />" data-transition="slide">
							${person.displayName!"N/A"} (${person.nextCallDate?datetime?string("MMM d")})
						</a>
					</li>
					</#list>
                	
                </ul>
                
                <div data-role="navbar" data-iconpos="top">
                    <ul>
                        <li>
                            <a href="<@spring.url '/' />" data-theme="" data-icon="home" class="ui-btn-active">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="<@spring.url '/persons' />" data-theme="" data-icon="grid">
                                Everyone
                            </a>
                        </li>
                        <li>
                            <a href="#page1" data-theme="" data-icon="">
                                Notes
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
	
		
	
</body>
</html>