<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Refresh" content="20" />
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
        <h2>Stock values:</h2>
        <p>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wigLabel" runat="server" Text='<%# Eval("wig") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20Label" runat="server" Text='<%# Eval("wig20") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20futLabel" runat="server" Text='<%# Eval("wig20fut") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20usdLabel" runat="server" Text='<%# Eval("wig20usd") %>' />
                        </td>
                        <td>
                            <asp:Label ID="swig80Label" runat="server" Text='<%# Eval("swig80") %>' />
                        </td>
                        <td>
                            <asp:Label ID="mwig40Label" runat="server" Text='<%# Eval("mwig40") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wigTextBox" runat="server" Text='<%# Bind("wig") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wig20TextBox" runat="server" Text='<%# Bind("wig20") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wig20futTextBox" runat="server" Text='<%# Bind("wig20fut") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wig20usdTextBox" runat="server" Text='<%# Bind("wig20usd") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="swig80TextBox" runat="server" Text='<%# Bind("swig80") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="mwig40TextBox" runat="server" Text='<%# Bind("mwig40") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wigTextBox" runat="server" Text='<%# Bind("wig") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wig20TextBox" runat="server" Text='<%# Bind("wig20") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wig20futTextBox" runat="server" Text='<%# Bind("wig20fut") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wig20usdTextBox" runat="server" Text='<%# Bind("wig20usd") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="swig80TextBox" runat="server" Text='<%# Bind("swig80") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="mwig40TextBox" runat="server" Text='<%# Bind("mwig40") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wigLabel" runat="server" Text='<%# Eval("wig") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20Label" runat="server" Text='<%# Eval("wig20") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20futLabel" runat="server" Text='<%# Eval("wig20fut") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20usdLabel" runat="server" Text='<%# Eval("wig20usd") %>' />
                        </td>
                        <td>
                            <asp:Label ID="swig80Label" runat="server" Text='<%# Eval("swig80") %>' />
                        </td>
                        <td>
                            <asp:Label ID="mwig40Label" runat="server" Text='<%# Eval("mwig40") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">date</th>
                                        <th runat="server">wig</th>
                                        <th runat="server">wig20</th>
                                        <th runat="server">wig20fut</th>
                                        <th runat="server">wig20usd</th>
                                        <th runat="server">swig80</th>
                                        <th runat="server">mwig40</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wigLabel" runat="server" Text='<%# Eval("wig") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20Label" runat="server" Text='<%# Eval("wig20") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20futLabel" runat="server" Text='<%# Eval("wig20fut") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wig20usdLabel" runat="server" Text='<%# Eval("wig20usd") %>' />
                        </td>
                        <td>
                            <asp:Label ID="swig80Label" runat="server" Text='<%# Eval("swig80") %>' />
                        </td>
                        <td>
                            <asp:Label ID="mwig40Label" runat="server" Text='<%# Eval("mwig40") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockValuesContext %>" SelectCommand="SELECT [date], [wig], [wig20], [wig20fut], [wig20usd], [swig80], [mwig40] FROM [StockValues]"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
