﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ASEMasterInstructor.master" AutoEventWireup="true" CodeFile="InstructorHomePage.aspx.cs" Inherits="InstructorHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script>
         $(function () {
             var icons = {
                 header: "ui-icon-circle-arrow-e",
                 activeHeader: "ui-icon-circle-arrow-s"
             };
             $("#accordion").accordion({
                 icons: icons
             });
             $("#toggle").button().click(function () {
                 if ($("#accordion").accordion("option", "icons")) {
                     $("#accordion").accordion("option", "icons", null);
                 } else {
                     $("#accordion").accordion("option", "icons", icons);
                 }
             });
         });
         </script>
    <div id="accordion">
  <h3>Assigned Courses Progress</h3>
  <div>
      <div class ="form-group" style="margin-left:370px;">

          <asp:Label ID="lblProgress" runat="server" Text="Course Progress" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="#333300"></asp:Label>
           <br />
           <br />
   </div>
                <asp:Label ID="lblCourse1" runat="server" Text="Course Id : CS551MT     CourseName : Software Methods and Tools" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#333300"></asp:Label>
      <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
    <span class="sr-only">40% Complete (success)</span>
  </div>
</div>
       <br />
 
<asp:Label ID="lblCourse2" runat="server" Text="Course Id : CS551NA     CourseName : Network Architecture" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#333300"></asp:Label>

<div class="progress">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
    <span class="sr-only">20% Complete</span>
  </div>
</div>
    
           <br />
<div class="progress">
  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
    <span class="sr-only">60% Complete (warning)</span>
  </div>
</div>

           <br />
<div class="progress">
  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
    <span class="sr-only">80% Complete (danger)</span>
  </div>
</div>
       <br />
           <br />
       <br />
           <br />
       <br />
           <br />
      </div>
  <h3>Check Schedules</h3>
  <div style="border-left:30px;">
      
       <div class ="form-group" style="margin-left:370px;">

          <asp:Label ID="lblHeading" runat="server" Text="Assigned Courses" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="#333300"></asp:Label>
           <br />
           <br />
   </div>
    <asp:GridView ID="gvallotment" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CourseId" DataSourceID="SqldsAllotment" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="CourseId" HeaderText="CourseId" ReadOnly="True" SortExpression="CourseId">
             <HeaderStyle Font-Italic="True" Font-Size="Small" Width="200px" />
                <ItemStyle Font-Italic="True" />
                </asp:BoundField>
            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName">
                <HeaderStyle Font-Italic="True" Font-Size="Small" Width="200px" />
                <ItemStyle Font-Italic="True" />
                </asp:BoundField>
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:d}">
                <HeaderStyle Font-Italic="True" Font-Size="Small" Width="200px" />
                <ItemStyle Font-Italic="True" />
                </asp:BoundField>
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" DataFormatString="{0:d}">
                <HeaderStyle Font-Italic="True" Font-Size="Small" Width="200px" />
                <ItemStyle Font-Italic="True"  />
                </asp:BoundField>
            <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits">
                <HeaderStyle Font-Italic="True" Font-Size="Small" Width="200px" />
                <ItemStyle Font-Italic="True"  />
                </asp:BoundField>
            
            <asp:ButtonField ButtonType="Button" CommandName="Schedule" Text="Get Schedule">
            <ItemStyle Font-Bold="True" Font-Italic="True" />
                <ControlStyle CssClass="btn btn-lg btn-primary btn-block" />
            </asp:ButtonField>
            
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqldsAllotment" runat="server" ConnectionString="<%$ ConnectionStrings:ASEDataBase %>" SelectCommand="SELECT tbl_Course.CourseId, tbl_Course.CourseName, tbl_Course.StartDate, tbl_Course.EndDate, tbl_Course.Credits FROM tbl_Course INNER JOIN tbl_CourseAllotment ON tbl_Course.CourseId = tbl_CourseAllotment.CourseId AND tbl_CourseAllotment.InstructorId = @t1">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="11" Name="t1" SessionField="InstructorId" />
        </SelectParameters>
    </asp:SqlDataSource>
  </div>
    </div>  
</asp:Content>

