<%@ Page Language="C#" Inherits="Plugin.Oss.PageConfiguration" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link href="../../../siteserver/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../../siteserver/assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="../../../siteserver/assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="../../../siteserver/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../../../siteserver/assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="../../../siteserver/assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="../../../siteserver/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <script src="../../../siteserver/assets/jquery/jquery-1.9.1.min.js"></script>
</head>

<body>
    <div style="padding: 20px 0;">

        <div class="container">

            <form runat="server" class="form-horizontal">

                <div class="row">
                    <div class="panel panel-border panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">如何配置本插件？</h3>
                        </div>
                        <div class="panel-body">
                            <ul>
                                <li>进入阿里云控制台Access Key管理，获取Access Key ID和Access Key Secret</li>
                                <li>登录阿里云控制台，进入对象存储OSS，创建Bucket，在属性设置读写权限为公开读，记下Bucket名称</li>
                                <li>进入Bucket概览，获取Bucket EndPoint</li>
                                <li>设置云存储Bucket目录，站点的所有文件将存储在此根目录下，不设置为保存在根目录</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="card-box">
                        <div class="row">
                            <div class="col-lg-10">
                                <h4 class="m-t-0 header-title"><b>阿里云OSS云存储</b></h4>
                                <p class="text-muted font-13 m-b-30">
                                    关闭云存储后，站点文件将不再被同步上传到云存储中，之前上传的文件仍然能够被访问
                                </p>
                            </div>
                        </div>

                        <div class="row">

                            <div class="form-group">
                                <label class="col-sm-3 control-label">开启云存储</label>
                                <div class="col-sm-6">
                                    <asp:CheckBox runat="server" ID="CbIsOss" AutoPostBack="true" OnCheckedChanged="CbIsOss_OnSelectedIndexChanged" CssClass="checkbox checkbox-primary"
                                        Text="启用云存储" />
                                    <p class="text-muted font-13 m-b-30">
                                        启用云存储后，本站点下的所有文件将同步上传到云存储中
                                    </p>
                                </div>
                            </div>

                            <asp:PlaceHolder ID="PhOss" runat="server">

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">阿里云 Access Key ID</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TbAccessKeyId" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:RequiredFieldValidator ControlToValidate="TbAccessKeyId" ErrorMessage=" *" ForeColor="red" Display="Dynamic" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">阿里云 Access Key Secret</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TbAccessKeySecret" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:RequiredFieldValidator ControlToValidate="TbAccessKeySecret" ErrorMessage=" *" ForeColor="red" Display="Dynamic" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">云存储Bucket名称</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TbBucketName" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:RequiredFieldValidator ControlToValidate="TbBucketName" ErrorMessage=" *" ForeColor="red" Display="Dynamic" runat="server" />
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">云存储Bucket EndPoint</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TbBucketEndPoint" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:RequiredFieldValidator ControlToValidate="TbBucketEndPoint" ErrorMessage=" *" ForeColor="red" Display="Dynamic" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">云存储Bucket目录</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TbBucketPath" class="form-control" runat="server" />
                                    </div>
                                    <div class="col-sm-3">
                                        
                                    </div>
                                </div>

                                <div class="form-group m-b-0">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <asp:Button class="btn btn-primary" ID="Submit" Text="确 定" OnClick="Submit_OnClick" runat="server" />
                                    </div>
                                </div>

                            </asp:PlaceHolder>

                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</body>

</html>