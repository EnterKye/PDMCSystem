<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
    </form>
    <script type="text/javascript">
        var url = 'http://172.16.73.43/index.html';
        alert(GetRequest());
        function GetRequest() {
            var url = 'http://localhost:57778/index.html#';
            if (url.indexOf("#")!=-1) {
                alert("ok");
                url = url.substr(num + 1);
                return url;
            }
            else {
                alert("NG");
            }
            
        }
    </script>
</body>
</html>
