﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopPointTransfer.aspx.cs" Inherits="ChainStock.SystemManage.ShopPointTransfer" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
 <link href="../Inc/Style/Style.css" rel="stylesheet" />
    
    <link href="../Inc/artDialogskins/blue.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-common.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.artDialog.basic.js" type="text/javascript"></script>
    <script src="../Scripts/artDialog.iframeTools.js" type="text/javascript"></script>
    <script src="../Scripts/Module/Common/Common.js" type="text/javascript"></script>
            <script src="../Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmShopPoint" runat="server">
      <input type="hidden" id="hdShopID" runat="server" />
    <table style="width: 100%; height: 100%; word-wrap: break-word;" cellspacing="7">
        <tr>
            <td colspan="2" style="width: 100%;">
                <div class="system_Info">
                    <div class="system_Top">
                        <div class="user_regist_title">
                            <asp:Literal runat="server" ID="ltlTitle"></asp:Literal>
                        </div>
                    </div>
                    <div class="user_List_All">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#434343"
                            class="tableStyle">
                            <tr>
                                <td class="tableStyle_left">
                                    单号：
                                </td>
                                <td class="tableStyle_right">
                                    <input id="txtShopPointAccount" type="text" runat="server" class="input_txt border_radius"
                                        title="商家积分划拨单号" />
                                </td>
                                <td class="tableStyle_left">
                                    商家：
                                </td>
                                <td class="tableStyle_right">
                                    <select id="sltShop" runat="server" class="selectWidth">
                                    </select>
                                </td>
                               <td class="tableStyle_left">
                                    操作类型：
                                </td>
                                <td class="tableStyle_right">
                                    <select id="sltCzlx" runat="server" class="selectWidth">
                                        <option title="请选择" value="">=====请选择=====</option>
                                        <option title="充值积分" value="0">充值积分</option>
                                        <option title="扣除积分" value="1">扣除积分</option>
                                        <option title="发放积分" value="2">发放积分</option>
                                        <option title="返利积分" value="3">返利积分</option>                                      
                                         <option title="回收积分" value="4">回收积分</option>
                                         <option title="积分使用" value="5">积分使用</option>
                                           <option title="积分提现" value="6">积分提现</option>
                                           
                                                <option title="撤单返还积分" value="7">撤单返还积分</option>
                                    </select>
                                </td>
                                </tr>
                                <tr>
                                  <td class="tableStyle_left">
                                    变动时间：
                                </td>
                                <td class="tableStyle_right">
                                    <input id="txtStartTime" type="text" runat="server" class="Wdate border_radius" onclick="WdatePicker({ skin: 'ext', isShowClear: true, readOnly: true})" />
                                </td>
                                <td class="tableStyle_left">
                                    &nbsp;至&nbsp;&nbsp;&nbsp;
                                </td>
                                  <td class="tableStyle_right">
                                    <input id="txtEndTime" type="text" runat="server" class="Wdate border_radius"  onclick="WdatePicker({ skin: 'ext', isShowClear: true, readOnly: true})" />
                                </td>
                                <td class="tableStyle_right">
                                    <div class="user_List_Button">
                                        <asp:Button ID="btnShopPointQuery" runat="server" Text="查   询" class="common_Button"
                                            OnClick="btnShopPointQuery_Click" />
                                    </div>
                                </td>
                            </tr>
                        </table>                        
                        <table class="table-style table-hover user_List_txt">
                            <asp:Repeater runat="server" ID="gvShopPointList" OnItemDataBound="gvShopPointList_ItemDataBound">
                                <HeaderTemplate>
                                    <thead class="thead">
                                        <tr class="th">
                                            <th>
                                                序  号
                                            </th>
                                            <th>
                                                单  号
                                            </th>
                                            <th>
                                                操作类型
                                            </th>
                                             <th>
                                                变动对象
                                            </th>
                                            <th>
                                                变动数量
                                            </th>
                                            <th>
                                                时  间
                                            </th>
                                           
                                           
                                            <th>
                                                操作商家
                                            </th>
                                            <th>
                                                操作员
                                            </th>
                                            <th>
                                                备  注
                                            </th>                                           
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="td">
                                        <td>
                                            <asp:Label ID="lblNumber" runat="server" Text="1"></asp:Label>
                                        </td>
                                        <td>
                                            <%# Eval("ShopPointAccount")%>
                                        </td>
                                        <td>
                                             <asp:Label ID="lblShopPointType" runat="server" Text=""></asp:Label>  
                                        </td>
                                          <td>
                                            <%# Eval("ShopName")%>
                                        </td>
                                        
                                        <td  style=" color:Red;">
                                            <%# Eval("Count")%>
                                        </td>
                                        <td>
                                            <%# Eval("CreateTime")%>
                                        </td>
                                       
                                      
                                            <td style="text-align: left">
                                  <%# BindShopName(Eval("ShopID"))%>
                            </td>
                                     

                                        <td>
                                            <%# Eval("UserName")%>
                                        </td>
                                        <td style="text-align: left;">
                                            <%# Eval("Remark")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>                        
                       <div class="user_List_page">                       
                            <table style="width: 100%" id="tabPager1">
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