<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FirmaRegistreerimissusteem.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h1>XML: Töötajad</h1>
        <div>
        <asp:Xml runat="server"
            DocumentSource="~/tootajad.xml"
            TransformSource="~/tootajad.xslt">

        </asp:Xml>
    </div>
    </main>
</asp:Content>
