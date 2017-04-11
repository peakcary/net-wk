<%@ Page Title="bus_order" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WK.Web.bus_order.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script language="javascript" src="/js/CheckBox.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--Title -->

            <!--Title end -->

            <!--Add  -->

            <!--Add end -->

            <!--Search -->
            <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>
                    <td style="width: 80px" align="right" class="tdbg">
                         <b>关键字：</b>
                    </td>
                    <td class="tdbg">                       
                    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSearch" runat="server" Text="查询"  OnClick="btnSearch_Click" >
                    </asp:Button>                    
                        
                    </td>
                    <td class="tdbg">
                    </td>
                </tr>
            </table>
            <!--Search end-->
            <br />
            <asp:GridView ID="gridView" runat="server" AllowPaging="True" Width="100%" CellPadding="3"  OnPageIndexChanging ="gridView_PageIndexChanging"
                    BorderWidth="1px" DataKeyNames="id" OnRowDataBound="gridView_RowDataBound"
                    AutoGenerateColumns="false" PageSize="10"  RowStyle-HorizontalAlign="Center" OnRowCreated="gridView_OnRowCreated">
                    <Columns>
                    <asp:TemplateField ControlStyle-Width="30" HeaderText="选择"    >
                                <ItemTemplate>
                                    <asp:CheckBox ID="DeleteThis" onclick="javascript:CCA(this);" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField> 
                            
		<asp:BoundField DataField="order_status" HeaderText="order_status" SortExpression="order_status" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="pay_status" HeaderText="pay_status" SortExpression="pay_status" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="pay_type" HeaderText="pay_type" SortExpression="pay_type" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="dilivery_user_id" HeaderText="dilivery_user_id" SortExpression="dilivery_user_id" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="pickup_address_id" HeaderText="pickup_address_id" SortExpression="pickup_address_id" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="consignee_name" HeaderText="consignee_name" SortExpression="consignee_name" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="consignee_phone" HeaderText="consignee_phone" SortExpression="consignee_phone" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="total_plan_price" HeaderText="total_plan_price" SortExpression="total_plan_price" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="total_real_price" HeaderText="total_real_price" SortExpression="total_real_price" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="meal_num" HeaderText="meal_num" SortExpression="meal_num" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="pickup_start_time" HeaderText="pickup_start_time" SortExpression="pickup_start_time" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="pickup_end_time" HeaderText="pickup_end_time" SortExpression="pickup_end_time" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="pickup_date" HeaderText="pickup_date" SortExpression="pickup_date" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="is_delete" HeaderText="is_delete" SortExpression="is_delete" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="remark" HeaderText="remark" SortExpression="remark" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="create_by" HeaderText="create_by" SortExpression="create_by" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="create_date" HeaderText="create_date" SortExpression="create_date" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="update_by" HeaderText="update_by" SortExpression="update_by" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" ItemStyle-HorizontalAlign="Center"  /> 
                            
                            <asp:HyperLinkField HeaderText="详细" ControlStyle-Width="50" DataNavigateUrlFields="id" DataNavigateUrlFormatString="Show.aspx?id={0}"
                                Text="详细"  />
                            <asp:HyperLinkField HeaderText="编辑" ControlStyle-Width="50" DataNavigateUrlFields="id" DataNavigateUrlFormatString="Modify.aspx?id={0}"
                                Text="编辑"  />
                            <asp:TemplateField ControlStyle-Width="50" HeaderText="删除"   Visible="false"  >
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                         Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                </asp:GridView>
               <table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
                <tr>
                    <td style="width: 1px;">                        
                    </td>
                    <td align="left">
                        <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_Click"/>                       
                    </td>
                </tr>
            </table>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>--%>
