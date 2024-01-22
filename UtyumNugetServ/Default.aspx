<%@ Page Language="C#" %>

<%@ Import Namespace="NuGet.Server" %>
<%@ Import Namespace="NuGet.Server.App_Start" %>
<%@ Import Namespace="NuGet.Server.Infrastructure" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>NuGet Private Repository</title>
    <link rel="icon" href="https://hot.advicetech.com.br/wp-content/uploads/2019/01/cropped-logo-1-32x32.png" sizes="32x32" />
    <style>
        body {
            font-family: Calibri;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html,
        body {
            min-height: 100vh;
        }

        body {
            font-family: Calibri;
            display: flex;
            flex-direction: column;
        }

            body > .main-content {
                flex-grow: 1;
            }

        /** Estilos opcionais. */

        .main-header {
            background-color: #f1f1f1;
            border-bottom: solid 1px #ddd;
            padding: 20px;
        }

        .main-content {
            padding: 20px;
        }

        .main-footer {
            background-color: #333;
            border-top: #303030;
            padding: 20px;
            color: #fff;
        }

        div {
            padding: 20px;
        }
    </style>
</head>
<body>
    <header class="main-header">
      <h2><img alt="" class="auto-style1" src="img/logo_texto.png" style="width:139px; height:35px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Você está conectado ao NuGet Server Private</h2>
    </header>
    <div class="main-content">
        <div>
            <p>
                Clique <a href="<%= VirtualPathUtility.ToAbsolute("~/nuget/Packages") %>">Aqui</a> para ver seus pacotes.
            </p>
            <p>
                &nbsp;
            </p>
            <fieldset style="width: 800px; height: 191px; padding: 10px;">
                <legend><strong>Repository URLs</strong></legend>
                Nas configurações do gerenciador de pacotes, adicione o seguinte URL à lista de
             Fontes do pacote:<br />
                <br />
                <blockquote>
                    <strong style="margin-left: 25px"><%= Helpers.GetRepositoryUrl(Request.Url, Request.ApplicationPath) %></strong>
                </blockquote>
                <br />
                <% if (string.IsNullOrEmpty(ConfigurationManager.AppSettings["apiKey"]))
                    { %>
            Para habilitar o envio de pacotes para este feed usando o <a href="https://www.nuget.org/downloads">NuGet ferramenta de linha de comando</a> (nuget.exe), definir a chave da API appSetting em web.config.<br />
                <% }
                else
                { %>
            Use o comando abaixo para enviar pacotes para este feed usando o <a href="https://www.nuget.org/downloads">NuGet ferramenta de linha de comando</a> (nuget.exe).
            <% } %><br />
                <blockquote>
                    <strong style="margin-left: 25px">nuget.exe push {package file} {apikey} -Source <%= Helpers.GetPushUrl(Request.Url, Request.ApplicationPath) %></strong>
                </blockquote>
            </fieldset>
            &nbsp;<% if (Request.IsLocal)
                      { %>
            <% } %>
            <fieldset style="width: 800px; height: 106px; padding: 10px;">
                <legend><strong>Adicionando pacotes</strong></legend>
                Para adicionar pacotes ao feed, coloque os arquivos do pacote (arquivos .nupkg) na pasta
            <code style="color: orangered"><% = PackageUtility.PackagePhysicalPath %></code><br />
                <br />
                Clique <a href="<%= VirtualPathUtility.ToAbsolute("~/nuget/clear-cache") %>">Aqui</a> para limpar o cache do pacote.
            </fieldset>
        </div>
    </div>
    <footer class="main-footer">
      <p><img class="alignnone wp-image-215" src="https://hot.advicetech.com.br/wp-content/uploads/2019/01/logo_texto_negativo1-1.png" alt="" width="180" /></p>
<p><span style="color: #bfbfbf;">@2021 Utyum. All rights reserved.</span></p>
    </footer>
</body>
</html>
