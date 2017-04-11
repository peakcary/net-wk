<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="WK.Web.bus_order.Add" Title="增加页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">
                
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		order_status
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtorder_status" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pay_status
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtpay_status" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pay_type
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtpay_type" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		user_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtuser_id" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		dilivery_user_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtdilivery_user_id" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pickup_address_id
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtpickup_address_id" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		consignee_name
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtconsignee_name" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		consignee_phone
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtconsignee_phone" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		total_plan_price
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txttotal_plan_price" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		total_real_price
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txttotal_real_price" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		meal_num
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtmeal_num" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pickup_start_time
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtpickup_start_time" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pickup_end_time
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtpickup_end_time" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		pickup_date
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox ID="txtpickup_date" runat="server" Width="70px"  onfocus="setday(this)"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		is_delete
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtis_delete" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		remark
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtremark" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		create_by
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtcreate_by" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		create_date
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox ID="txtcreate_date" runat="server" Width="70px"  onfocus="setday(this)"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		update_by
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtupdate_by" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		update_date
	：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox ID="txtupdate_date" runat="server" Width="70px"  onfocus="setday(this)"></asp:TextBox>
	</td></tr>
</table>
<script src="/js/calendar1.js" type="text/javascript"></script>

            </td>
        </tr>
        <tr>
            <td class="tdbg" align="center" valign="bottom">
                <asp:Button ID="btnSave" runat="server" Text="保存"
                    OnClick="btnSave_Click" class="inputbutton" onmouseover="this.className='inputbutton_hover'"
                    onmouseout="this.className='inputbutton'"></asp:Button>
                <asp:Button ID="btnCancle" runat="server" Text="取消"
                    OnClick="btnCancle_Click" class="inputbutton" onmouseover="this.className='inputbutton_hover'"
                    onmouseout="this.className='inputbutton'"></asp:Button>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>--%>
