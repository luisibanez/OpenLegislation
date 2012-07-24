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
		
		<link rel="shortcut icon" href="<%=appPath%>/img/nys_favicon_0.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/style.css"/>
		<link rel="stylesheet" type="text/css" media="print" href="<%=appPath%>/print.css">
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<%=appPath%>/feed" />
		
		<script type="text/javascript" src="<%=appPath%>/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="<%=appPath%>/js/search.js"></script>
	 
		<script type="text/javascript">
			searchType = "<%=searchType%>";
		</script>
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
            <a class='brand' href="<%=appPath%>/"><img src="<%=appPath%>/img/openleglogo.gif" /></a> 
         		 <div class="nav-collapse collapse">
            <ul class="nav">
            <%if (searchType.startsWith("bill")||searchType.equals("search")||searchType.equals("sponsor")||searchType.equals("committee")){ %>
							 <li class=""><a href="<%=appPath%>/bills/"  class="linkActivated" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
						<%}else{ %>
							<li class=""><a href="<%=appPath%>/bills/" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
						<%} %>
						<li class=""><a href="<%=appPath%>/calendars/"  <%if (searchType.startsWith("calendar")){%>class="linkActivated"<%} %> title="View recent and search floor calendars and active lists by number or date (i.e. 11/07/2009)">Calendars</a></li> 						
						<li class=""><a href="<%=appPath%>/meetings/"  <%if (searchType.startsWith("meeting")){%>class="linkActivated"<%} %> title="View upcoming and recent committee meetings, and search by committee, chairperson, location, date (i.e. 11/07/2009) and more.">Meetings</a>
 			 			<li class=""><a href="<%=appPath%>/transcripts/" <%if (searchType.startsWith("transcript")){%>class="linkActivated"<%} %> title="View and search Senate floor full text transcripts">Transcripts</a></li>	 
						<li class=""><a href="<%=appPath%>/actions/"  <%if (searchType.startsWith("action")){%>class="linkActivated"<%} %> title="View and filter Floor Actions on Bills from the Floor of the Senate">Actions</a></li>
 						<li class=""><a href="<%=appPath%>/votes"  <%if (searchType.startsWith("vote")){%>class="linkActivated"<%} %> title="Recent committee and floor votes on Senate bills">Votes</a></li>
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
   
   
