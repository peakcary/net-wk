﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="WK.Web.bus_order.Show" Title="显示页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>                   
                    <td class="tdbg">
                               
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		auto_increment
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblid" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		order_status
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblorder_status" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		payment_status
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblpayment_status" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		market_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblmarket_id" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		user_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lbluser_id" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		dilivery_user_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lbldilivery_user_id" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pickup_address_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblpickup_address_id" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		consignee_name
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblconsignee_name" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		consignee_phone
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblconsignee_phone" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		total_plan_price
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lbltotal_plan_price" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		total_real_price
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lbltotal_real_price" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		meal_num
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblmeal_num" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		is_delete
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblis_delete" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		remark
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblremark" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		create_by
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblcreate_by" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		create_date
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblcreate_date" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		update_by
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblupdate_by" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		update_date
	：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblupdate_date" runat="server"></asp:Label>
	</td></tr>
</table>

                    </td>
                </tr>
            </table>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>--%>




