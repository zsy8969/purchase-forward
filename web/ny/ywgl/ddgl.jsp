<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/button.css" rel="stylesheet" type="text/css">
<html>
<head>
<title>Untitled Document</title>
<script type="text/javascript" src="../js/public.js"></script>
<script language="JavaScript">
function doDBClick(url,operator,type) {
  if (operator == false) {
    document.forms[0].action = url + "&op=view";
    document.forms[0].submit();
  } else {
    document.forms[0].action = url;
    document.forms[0].submit();
  }
}
</script>
</head>

<body>

<table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="where">
  <tr>
    <td>&nbsp;&nbsp;※&nbsp;您的位置：我的桌面--&gt;业务管理--&gt;用工管理</td>
    <td align="right">&nbsp;</td>
  </tr>
</table>
<br/>

<form method="post" action="${pageContext.request.contextPath}/ny/employersvl">
  <input type="hidden" name="reqType" value="queryDeal">
  <table width="96%" height="30" border="0" align="center" cellpadding="0" cellspacing="0" class="MENU_line">
    <tr>
      <td width="67%" align="right" class="text" nowrap>&nbsp;雇主：
        <input type="text" name="searchName" maxlength="20" size="12" value="" class="input">
        &nbsp; 登记日期：
        <input type="text" name="searchName2" maxlength="20" size="12" value="" class="input">
        到
        <input type="text" name="searchName3" maxlength="20" size="12" value="" class="input">
        &nbsp; 雇用工人：
        <input type="text" name="searchName4" maxlength="20" size="12" value="" class="input">
&nbsp;状态：
<select name="select" id="select" class="input">
  <option selected>请选择</option>
  <option>未成交</option>
  <option>已成交</option>
  <option>在别处成交</option>
  <option>已取消</option>
</select>
        <input type="submit" name="searchbtn" value="查  询" class="button_new">
        <input type="button" name="searchbtn2" value="新  增" class="button_new"onClick="javascript:location.href='../employersvl?reqType=addusework'" >
      &nbsp;&nbsp; </td>
    </tr>
  </table>
</form>
<br>
  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#bdc7d3">
    <tr align="center" class="tdtitle">
      <td nowrap align="center" width="4%">序号</td>
      <td width="8%" align="center" nowrap id="name" >雇主</td>
      <td width="6%" height="24" align="center" nowrap id=".name" ><div align="center" orderBy="true">手机/固</div></td>
      <td width="16%" height="24" align="center" nowrap id=".phone" ><div align="center" orderBy="true">工人</div></td>
      <td width="11%" align="center" nowrap id=".title" ><div align="center" orderBy="true">手机/固</div></td>
      <td width="7%" align="center" nowrap id="register" ><div align="center" orderBy="true">工资/月</div></td>
      <td width="31%" align="center" nowrap id=".register" ><strong>工作类型</strong></td>
      <td width="8%" align="center" nowrap id="submit_date" ><strong>状态</strong></td>
      <td width="9%" align="center" nowrap id=".submit_date" ><strong>操作</strong></td>
    </tr>
    <c:forEach items="${queryDealList}" var="deal">
    <tr align="center" class="td2"  onmouseover="javascript:changeBgColorOnMouseOver(this);" onMouseOut="javascript:changeBgColorOnMouseOut(this);" onDblClick="doDBClick('bl.htm',true,'2');">
      <td nowrap align="center" width="4%">${deal.index} </td>
      <td align="center" nowrap>${deal.empname}</td>
      <td height="14" align="center" nowrap>${deal.empphone}</td>
      <td align="center" nowrap>${deal.workname}</td>
      <td align="center" nowrap>${deal.workphone}</td>
      <td align="center" nowrap>${deal.price}</td>
      <td align="center" nowrap>${deal.worktype}</td>
      <td align="center" nowrap>${deal.statu}</td>
      <td align="center" nowrap><a href="${pageContext.request.contextPath}/ny/employersvl?reqType=queryDealAll&dealid=${deal.dealid}">查看</a> <a href="${pageContext.request.contextPath}/ny/employersvl?reqType=updateDeal&dealid=${deal.dealid}">修改</a></td>
    </tr>
    </c:forEach>
  </table>
<table width="96%" height="10"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><input type="hidden" name="orderType" value="asc">
          <input type="hidden" name="orderFid" value=".submit_date">
          <table width="90%" style="font-size:12px;" border="0" cellspacing="3" cellpadding="2">
            <tr>
              <td nowrap width="45%" align="center"> 当前第1页 共5记录 分1页显示 </td>
              <td nowrap width="55%" align="right"><input type="hidden" name="currentPage" value="1">
                  <input type="hidden" name="paginationAction" value="">
                  <img src="../image/First_no.gif" alt="第一页" width="18" height="13" border="0">&nbsp&nbsp&nbsp <img src="../image/Previous_no.gif" alt="上一页" width="14" height="13" border="0">&nbsp&nbsp&nbsp <img src="../image/Next_no.gif" alt="下一页" width="14" height="13" border="0">&nbsp&nbsp&nbsp <img src="../image/Last_no.gif" alt="最后一页" width="18" height="13" border="0">&nbsp&nbsp&nbsp <a href="javascript:this.document.AwaitForm.submit()" oncontextmenu="return false" onClick="if(this.document.AwaitForm.pageSelect.value==''){ alert('页码必须输入');return false;}
 else {this.document.AwaitForm.paginationAction.value='gotoPage';}">前往</a>
                  <input type=text size='4' onlytype='int' onfocus='checkTextBoxInput()' name='pageSelect' value=''/>
                页 </td>
            </tr>
          </table>

      </td>
    </tr>
  </table>

</body>
</html>
