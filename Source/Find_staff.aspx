<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Find_staff.aspx.cs" Inherits="Find_staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
            <!--
      CIS 470
    author
    -->


<!-- Find_staff.aspx
     
 -->

     <div class="content-header" style="text-align: left;">Find Staff for <asp:Label ID="lblCName" runat="server" Text=""></asp:Label></div>
    <div class="content">
        <asp:Button ID="BtnModifyContract" class="btn btn-primary" runat="server" Text="Modify Contract" /><br /><br />
        <asp:Table ID="tblStaff" runat="server" class="blk-border" style="text-align:center;">
        </asp:Table>
    </div>
</asp:Content>

