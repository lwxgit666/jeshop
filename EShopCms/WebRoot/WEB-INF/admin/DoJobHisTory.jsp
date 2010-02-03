<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><s:head/>
 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审核历史记录</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
* {margin:0; padding:0; outline:none}
body {font:10px Verdana,Arial; margin:25px; background:#fff url(images/bg.gif) repeat-x; color:#091f30}

.sortable {width:650px; border-left:1px solid #c6d5e1; border-top:1px solid #c6d5e1; border-bottom:none; margin:0 auto 15px}
.sortable th {background:url(images/header-bg.gif); height:25px; text-align:left; color:#cfdce7; border:1px solid #fff; border-right:none; font-size:12px;
text-align:center; vertical-align:middle;}
.sortable th h3 {font-size:10px; padding:6px 8px 8px}
.sortable td {padding:4px 6px 6px; border-bottom:1px solid #c6d5e1; border-right:1px solid #c6d5e1}
.sortable .head h3 {background:url(images/sort.gif) 7px center no-repeat; cursor:pointer; padding-left:18px}
.sortable .desc, .sortable .asc {background:url(images/header-selected-bg.gif)}
.sortable .desc h3 {background:url(images/desc.gif) 7px center no-repeat; cursor:pointer; padding-left:18px}
.sortable .asc h3 {background:url(images/asc.gif) 7px  center no-repeat; cursor:pointer; padding-left:18px}
.sortable .head:hover, .sortable .desc:hover, .sortable .asc:hover {color:#fff}
.sortable .evenrow td {background:#fff}
.sortable .oddrow td {background:#ecf2f6}
.sortable td.evenselected {background:#ecf2f6}
.sortable td.oddselected {background:#dce6ee}

#controls {width:980px; margin:0 auto; height:25px}
#perpage {float:left; width:200px}
#perpage select {float:left; font-size:11px}
#perpage span {float:left; margin:2px 0 0 5px}
#navigation {float:left; width:580px; text-align:center}
#navigation img {cursor:pointer}
#text {float:left; width:200px; text-align:right; margin-top:2px}


body,td,th {
	font-size: 12px;
}
a:link {
	color:#0066FF;
	font-weight:bold;
	text-decoration: none;
}
a:visited {
	color: #666666;
	font-weight:bold;
	text-decoration: none;
}
a:hover {
	color: #666666;
	font-weight:bold;
	text-decoration: none;
}
a:active {
	color: #666666;
	font-weight:bold;
	text-decoration: none;
}
.contentpagelist
{
border:1px  #CCCCCC outset; padding:2px; margin:3px; width:20px; height:20px; margin-bottom:0px; cursor:hand;}
</style>
<script type="text/javascript" src="../jQuery/jquery/jquery-1.3.2.mini.js"></script>
<script type="text/javascript">


	function showPageList(id,allNum)
{
for(var i=1;i<=allNum;i++)
{
  if(i==id)
  {
  $("#page"+i).show();
  $("#contentpagelist"+i).css("color","red");
  $("#curpagelist").html("当前第"+i+"页");
  }else{
   $("#page"+i).hide();
   $("#contentpagelist"+i).css("color","black");
   }
}
}

	
</script>
</head>


<body>
<table  border="00" cellspacing="1" cellpadding="0" id="table" class="sortable">
 <thead> 
      
      <tr>
        <th colspan="6" class="nosort" ><s:property value="#news.getTitle()"/> (历史记录)</th>
      </tr>
  </thead> 
  <tr>
        <td >

  开始时间</td>
    <td >发送人</td>
        <td >审核者</td>
        <td >结束时间</td>
        <td >审核过程</td>
  </tr>
  <s:iterator value="ListHistory()">
   <tr>
        <td >

  <s:property value="getStartData()"/>

  
&nbsp;  </td>
        <td > 
        <s:set name="userId" value="getUserId()"/> 
   <s:set name="sendId" value="getSendId()"/> 
   <s:set name="jobType" value="getJobType()"/>
  <s:if test="#jobType.equals('jobadminType')">
  <s:property value="findAdminName(#sendId)"/>
  </s:if>
   <s:if test="#jobType.equals('jobusertype')">
  <s:property value="findUserName(#sendId)"/>
   </s:if>&nbsp;</td>
        <td ><s:property value="findAdminName(#userId)"/>&nbsp;</td>
        <td ><s:property value="getOverdata()"/>&nbsp;</td>
        <td ><s:property value="getBeizhu()"/>&nbsp;</td>
   </tr>
        </s:iterator>
        </table>

</body>
</html>