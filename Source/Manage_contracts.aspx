<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manage_contracts.aspx.cs" Inherits="Manage_contracts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">

            <!--
    CIS 470
    Author
    -->


<!-- Manage_contracts.aspx
    -->

     <div class="content-header" style="text-align: left">Manage Contracts</div>
    <div class="content">
        <asp:Button ID="BtnNewContract" class="btn btn-primary" runat="server" Text="+ New Contract" PostBackUrl="~/New_contract.aspx" /><br /><br />
        <asp:Table ID="tblContracts" runat="server" class="blk-border" style="text-align:center;">
        </asp:Table>
    </div>
</asp:Content>

