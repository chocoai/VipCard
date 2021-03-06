﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechargeRule.aspx.cs" Inherits="ChainStock.MicroWebsite.RechargeRule" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Inc/Style/Style.css" rel="stylesheet" type="text/css" />
    

    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Module/Common/Common.js" type="text/javascript"></script>

    <script src="../Scripts/jquery-common.js" type="text/javascript"></script>

    <link href="../Inc/artDialogskins/blue.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.artDialog.basic.js" type="text/javascript"></script>

    <script src="../Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

    <script src="../Scripts/Module/MicroWebsite/RechargeRule.js" type="text/javascript"></script>
  
</head>
<body>
    <form id="frmRechargeRule" runat="server">
        <table style="width: 100%; height: 100%; word-wrap: break-word;" cellspacing="7">
            <tr>
                <td colspan="2" style="width: 100%;">
                    <div class="system_Info">

                        <div class="system_Top">
                            <div class="user_regist_title">
                                <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
                            </div>
                        </div>

                        <div id="RechargeRuleInfo" style="display:none;">
                            <table class="tableStyle" cellspacing="0" cellpadding="2" style="width: 500px; margin: auto">
                                <tr>
                                    <td class="tableStyle_left">
                                        <span style="color: #ff4800; vertical-align: middle">*</span>充值金额：
                                    </td>
                                    <td class="tableStyle_right">
                                        <input id="txtRechargeMoney" type="text" class="input_txt border_radius" style="width:100px;" />
                                        <input id="txtRuleID" type="hidden" runat="server" />

                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td class="tableStyle_left">
                                        <span style="color: #ff4800; vertical-align: middle">*</span>赠送金额：
                                    </td>
                                    <td class="tableStyle_right">
                                        <input id="txtGiveMoney" type="text" class="input_txt border_radius" style="width:100px;" />
                                    </td>
                                   
                                </tr>
                                <tr>
                                    <td class="tableStyle_left">
                                      备注：
                                    </td>
                                    <td class="tableStyle_right">
                                        <input id="txtRuleDesc" type="text" class="input_txt border_radius" style="width:250px;" />
                                    </td>
                                   
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">
                                        <input id="btnRechargeRuleSave" type="button" class="buttonColor" value="保   存 " />
                                        &nbsp
                                        <input id="btnRechargeRuleReset" type="button" class="buttonRest" value="重   置 " />
                                        <input type="hidden" id="txtType" />
                                    </td>
                                </tr>
                            </table>
                    </div>

                        <div class="user_List_All">
                            <div class="user_List_top">
                                <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#434343" class="tableStyle">
                                    <tr style="color: #333333; background-color: #F7F6F3;">
                                        <td class="user_List_styleLeft">
                                            快捷操作：
                                        </td>
                                       <td class="user_List_styleRight">
                                            <div class="user_List_Button">
                                                <input id="btnRechargeRuleAdd" type="button" value="充值赠送" class="common_Button" runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <table class="table-style table-hover user_List_txt">
                                <asp:Repeater runat="server" ID="gvRechargeRuleList">
                                    <HeaderTemplate>
                                        <thead class="thead">
                                            <tr class="th">
                                                <th>
                                                    序号
                                                </th>
                                                <th>
                                                    充值金额
                                                </th>
                                                <th>
                                                    赠送金额
                                                </th>
                                                <th>
                                                   备注
                                                </th>
                                                <th>
                                                    创建人
                                                </th>
                                                <th>
                                                    创建时间
                                                </th>
                                                <th>
                                                    操作
                                                </th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="td">
                                            <td>
                                                <asp:Label ID="lblNumber" runat="server" Text="1"></asp:Label>
                                            </td>
                                            <td >
                                                <%# Eval("RechargeMoney")%>
                                            </td>
                                            <td style="text-align: center">
                                                 <%# Eval("GiveMoney")%>
                                            </td>
                                            <td style="text-align: center">
                                                 <%# Eval("RuleDesc")%>
                                            </td>
                                            <td>
                                                <%#Eval("UserName") %>
                                            </td>
                                            <td style="text-align: center">
                                                <%#Eval("CreateTime") %>
                                            </td>
                                            <td class="listtd" style="width: 60px;">
                                                <a id="hyEdit" href='javascript:btnRechargeRuleEdit(<%#Eval("RuleID") %>)' >
                                                    <img  src="../images/Gift/eit.png" alt="编辑" title="编辑" />
                                                    </a> 
                                                <a id="hyDel" href='javascript:btnRechargeRuleDel(<%#Eval("RuleID") %>,<%#Eval("RechargeMoney") %>,<%#Eval("GiveMoney") %>)'>
                                                    <img src="../images/Gift/del.png" alt="删除" title="删除" /></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>

                            <div class="user_List_page">
                                <table style="width: 100%" id="tabPager">
                                    <tr>
                                        <td>
                                            <span id="spPageSize">&nbsp;每页记录数：</span>
                                            <asp:DropDownList ID="drpPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpPageSize_SelectedIndexChanged">
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>40</asp:ListItem>
                                                <asp:ListItem>50</asp:ListItem>
                                            </asp:DropDownList>
                                            <webdiyer:AspNetPager ID="NetPagerParameter" runat="server" AlwaysShow="True" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条"
                                                CssClass="paginator" CurrentPageButtonClass="cpb" FirstPageText="首页" LastPageText="尾页"
                                                NextPageText="下一页" OnPageChanging="NetPagerParameter_PageChanging" PrevPageText="上一页"
                                                ShowPageIndexBox="Always" PageSize="10" LayoutType="Table" PageIndexBoxType="DropDownList"
                                                ShowCustomInfoSection="Left" CustomInfoClass="paginator" CustomInfoSectionWidth="300px"
                                                SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" Direction="LeftToRight"
                                                HorizontalAlign="Right">
                                            </webdiyer:AspNetPager>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
