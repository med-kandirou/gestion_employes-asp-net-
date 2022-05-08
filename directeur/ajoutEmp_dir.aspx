<%@ Page Title="" Language="C#" MasterPageFile="~/Master_dir.Master" AutoEventWireup="true" CodeBehind="~/directeur/ajoutEmp_dir.aspx.cs" Inherits="Projet_Fin_Formation.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Wizard ID="Wizard1" DisplaySideBar="false" runat="server" ActiveStepIndex="0" Height="188px" Width="392px" OnFinishButtonClick="Wizard1_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Step 1">
                <asp:Label ID="Label1" runat="server" Text="id contrat"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtidContrat" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="CIN"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtCin1" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="tye du contrat"></asp:Label>
                &nbsp;&nbsp;
                <asp:RadioButton ID="CDD" runat="server" GroupName="contrat" Text="CDD" OnCheckedChanged="CDD_CheckedChanged" AutoPostBack="True" />
                &nbsp;
                <asp:RadioButton ID="CDI" runat="server" GroupName="contrat" Text="CDI" OnCheckedChanged="CDI_CheckedChanged" AutoPostBack="True" />
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Salaire"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtSalaire" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Date debut"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox id="txt_datedebut" placeholder="JJ/MM/AAAA" onfocus="(this.type='date')" onblur="(this.type='text')" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Date Fin"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox id="txt_datefin" placeholder="JJ/MM/AAAA" onfocus="(this.type='date')" onblur="(this.type='text')" runat="server"></asp:TextBox>
                <br />
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Step 2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label8" runat="server" Text="Nom"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtnom" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="Prenom"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtprenom" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Date naissance"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox id="txtDateNaiss" placeholder="JJ/MM/AAAA" onfocus="(this.type='date')" onblur="(this.type='text')" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label12" runat="server" Text="echelle"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="txtechelle" runat="server" Width="123px">
                </asp:DropDownList>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>

    <br />
    <br />

    <asp:Label ID="Label7" style="color:chartreuse;letter-spacing:3px;font-size:25px;" runat="server" Text="Label">Employe a été ajoute</asp:Label>
</asp:Content>
