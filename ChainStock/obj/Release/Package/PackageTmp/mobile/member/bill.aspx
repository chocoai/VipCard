﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="ChainStock.mobile.member.bill" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
    <meta name="viewport" content="width=device-width,height=device-height,user-scalable=no" />
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
	<title>微会员-账单记录</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/media.css">
	<link rel="stylesheet" type="text/css" href="css/color.css">
</head>
<body>
	<div class="section index" id="container">
		<div id="head" class="section">
			<div class="section header">
				<h1>账单记录</h1>
				<a href="javascript:void(0);" class="back-btn"><img src="images/prev.png"/></a>
				<a href="" class="head-icon" id="inWeb"><img src="images/web.png"/></a>
			</div>
		</div>
		<div id="content" class="section">
			<div class="section message-box">
				<asp:Repeater ID="rptBill" runat="server">
                <ItemTemplate>             
                    
				<div class="section mesg-line">
                    
					<div class="section">
						<p class="f-left t-left mesg-date"><%# DateTime.Parse(Eval("OrderCreateTime").ToString()).ToString("yyyy-MM-dd HH:mm:ss") %></p>
						<!-- <p class="f-right t-right mesg-surplus">剩余金额：￥1200.00</p> -->
					</div>
					<div class="section">
						<p class="f-left t-left mesg-type"><%#Eval("OrderType") %></p>
						<p class="f-right t-right mesg-money"><%#decimal.Parse(Eval("OrderDiscountMoney").ToString()) > 0 ?  "+"+ Eval("OrderDiscountMoney", "{0:F2}") : Eval("OrderDiscountMoney", "{0:F2}")%></p>
					</div>
					<!-- 此a标签仅作为该记录链接使用，没有内容 -->
					<a href="billDetail.aspx?OrderAccount='<%#Eval("OrderAccount") %>'"></a>
				</div>
                 </ItemTemplate>
                    </asp:Repeater>
			
			</div>
		</div>
		<!-- 底部浮动导航 -->
		<div class="foot-nav">
			<!-- 返回主页 -->
			<div class="f-left fix-nav fix-home">
				<a href="index.aspx"><img src="images/home.png"/></a>
			</div>
			<div class="f-left fix-nav fix-ch">
				<a href="##"><p>我的会员</p><img src="images/icon.png"/></a>
				<div class="foot-more">
					<a href="binding.aspx">会员卡绑定</a>
					<a href="myMember.aspx">我的会员卡</a>
					<a href="modifyPassword.aspx">修改密码</a>
				</div>
			</div>
			<div class="f-left fix-nav fix-ch">
				<a href="##"><p>会员服务</p><img src="images/icon.png"/></a>
				<div class="foot-more">
					<a href="pointExchange.aspx">积分兑换</a>
					<a href="bill.aspx">账单记录</a>
				</div>
			</div>
			<div class="f-left fix-nav fix-ch">
				<a href="rechargeOnline.aspx" id="onlineRecharge"><p>在线充值</p></a>
			</div>
		</div>
	</div>

<script type="text/javascript" src="scripts/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="scripts/script.js"></script>

</body>
</html>