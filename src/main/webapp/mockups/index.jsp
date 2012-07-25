<%@ page language="java" import="java.util.*, java.text.*,java.io.*,gov.nysenate.openleg.*,gov.nysenate.openleg.model.*" pageEncoding="UTF-8"%>
<%
	String appPath = request.getContextPath();
	String title = request.getParameter("title");
	if (title == null)
		title = "Open Legislation Service";
	title += " - New York State Senate";
		
	String term = (String)request.getAttribute("term");
	
	if (term == null)
		term = "";
	else
	{
		term = term.replaceAll("\"","&quot;");
	}
	
	String search = (String)request.getAttribute("search");
	if(search == null) {
		search = "";
	}
	else {
		search = search.replaceAll("\"","&quot;");
	}
	
	String searchType = (String)request.getAttribute("type");
	if (searchType == null)
		searchType = "";
%>

<html>
	<head>
		<title><%=title%></title>
		
		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
		<meta name="apple-mobile-web-app-capable" content="YES"/>
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<%=appPath%>/feed" />
		<link rel="shortcut icon" href="<%=appPath%>/img/nys_favicon_0.ico" type="image/x-icon" />
		
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/mockups/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/mockups/css/style.css"/>
		<link rel="stylesheet" type="text/css" media="print" href="<%=appPath%>/mockups/css/print.css">
		
		<script type="text/javascript" src="<%=appPath%>/mockups/js/jquery.js"></script>
	 	<script type="text/javascript" src="<%=appPath%>/mockups/js/bootstrap.js"></script>
	 

	</head>
	<body>  
	
		<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
        <div class=' '>
          <button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class='brand' href="<%=appPath%>/"><img src="<%=appPath%>/mockups/img/openleglogo.gif" /></a> 
         		 <div class="nav-collapse collapse">
            <ul class="nav">
            <%if (searchType.startsWith("bill")||searchType.equals("search")||searchType.equals("sponsor")||searchType.equals("committee")){ %>
							 <li  class="active" ><a href="<%=appPath%>/bills/" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
						<%}else{ %>
							<li class=""><a href="<%=appPath%>/bills/" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
						<%} %>
						<li <%if (searchType.startsWith("calendar")){%>class="active"<%} %> ><a href="<%=appPath%>/calendars/" title="View recent and search floor calendars and active lists by number or date (i.e. 11/07/2009)">Calendars</a></li> 						
						<li <%if (searchType.startsWith("meeting")){%>class="active"<%} %> ><a href="<%=appPath%>/meetings/" title="View upcoming and recent committee meetings, and search by committee, chairperson, location, date (i.e. 11/07/2009) and more.">Meetings</a>
 			 			<li <%if (searchType.startsWith("transcript")){%>class="active"<%} %>><a href="<%=appPath%>/transcripts/"  title="View and search Senate floor full text transcripts">Transcripts</a></li>	 
						<li <%if (searchType.startsWith("action")){%>class="active"<%} %>><a href="<%=appPath%>/actions/" title="View and filter Floor Actions on Bills from the Floor of the Senate">Actions</a></li>
 						<li <%if (searchType.startsWith("vote")){%>class="active"<%} %>><a href="<%=appPath%>/votes" title="Recent committee and floor votes on Senate bills">Votes</a></li>
						<% if(searchType.matches("(sponsor|bill|calendar|meeting|transcript|action|vote).*?")) { term = ""; } %>
							<li class=""><a href="<%=appPath%>/senators">Sponsor</a></li>
							<li class=""><a href="<%=appPath%>/committees">Committee</a></li>
					</ul>
					 <form method="get" action="<%=appPath%>/search/" class="navbar-search pull-left">
            			<input type="text" id="txtSearchBox" placeholder="Search" class="search-query span2" name="search" value="<%=search%>" autocomplete="off">	
						<input type="hidden" name="searchType" value="<%=searchType%>">	
						<input type="submit" value="Search"/>
						<a href="<%=appPath%>/advanced/">Advanced</a>
						
          			</form>
 					<div id="quickresult" class="quickresult-header"></div>
          </div>
          </div>
        </div>
      </div>
    </div>
	<div class="container pagebox">
	
	<!-- edit this xxx.jsp tag to load the other pages for now -->
	
	<jsp:include page="/mockups/templates/home.jsp" />
	
	<div class=''><hr/></div>

	<div id="footer" class='row'>
		<div class='span3'>
			<h4>OpenLegeslation</h4>
		
		</div>
		<div class='span3'>
			<h4>Connect</h4>
		
		</div>
		<div class='span3'>
			<h4>Nysenate.gov</h4>
		
		</div>
		<div class='span3'>
			<h4>last title</h4>
		
		</div>
	</div>
	<hr/>
	<div class='row'>
		<div class='span8'>
			<p>
				<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/us/"><img class="cc-logo" alt="Creative Commons License" src="http://i.creativecommons.org/l/by-nc-nd/3.0/us/88x31.png" align='left' /></a> This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/us/">Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 United States License</a>.<br /> Permissions beyond the scope of this license are available at <a cc="http://creativecommons.org/ns#" href="http://www.nysenate.gov/copyright-policy" rel="morePermissions">http://www.nysenate.gov/copyright-policy</a>.
	 		</p>
	 		<p>The software and services provided under this site are offered under the BSD License and the GPL v3 License.<br/></p>
		</div>
	</div>
</div>
	</body>
</html>
	
	
	
	