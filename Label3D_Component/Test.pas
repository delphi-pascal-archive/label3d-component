unit Test;
interface
uses Windows,Messages,SysUtils,Variants,Classes,Graphics,Controls,Forms,
     Dialogs,ExtCtrls,StdCtrls,Label_3D,ComCtrls,Mask,Buttons;
type
  TFormTest = class(TForm)
    Label3D1:Label3D;Groupe:TGroupBox;Style1:TRadioButton;Style2:TRadioButton;
    Style3:TRadioButton;GroupBox1:TGroupBox;ColorBox1:TColorBox;
    ColorBox2:TColorBox;ColorBoxFond:TColorBox;ColorBoxMouse:TColorBox;
    GroupBox2:TGroupBox;Intervalle:TMaskEdit;UDIntervalle:TUpDown;
    Sortie:TBitBtn;Ecart: TMaskEdit;UDEcart:TUpDown;Transparent:TCheckBox;
    Label1:TLabel;Label2:TLabel;Label3:TLabel;Label4:TLabel;
    Help:TBitBtn;Label5:TLabel;Label6:TLabel;
    procedure GroupeClick(Sender:TObject);
    procedure SortieClick(Sender:TObject);
    procedure ColorBoxChange(Sender:TObject);
    procedure TransparentClick(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure UDIntervalleChanging(Sender:TObject;var AllowChange:Boolean);
    procedure UDEcartChanging(Sender:TObject;var AllowChange:Boolean);
    procedure HelpClick(Sender:TObject);
  end;
var FormTest:TFormTest;
implementation
{$R *.dfm}
procedure TFormTest.FormShow(Sender:TObject);
begin
  ColorBox1.Selected:=Label3D1.Color1;
  ColorBox2.Selected:=Label3D1.Color2;
  ColorBoxFond.Selected:=Label3D1.ColorFond;
  Intervalle.Text:=IntToStr(Label3D1.Interval);
  ColorBoxMouse.Selected:=Label3D1.ColorMouse;
  Ecart.Text:=IntToStr(Label3D1.Ecart3D);
  If Label3D1.Transparent Then Transparent.Checked:=True
  Else Transparent.Checked:=False;
end;
procedure TFormTest.GroupeClick(Sender:TObject);
begin
  Label3D1.Invalidate;
  if Style1.Checked then Label3D1.LabelType:=Relief
  Else if Style2.Checked then Label3D1.LabelType:=Clignotant
  Else if Style3.Checked Then Label3D1.LabelType:=Defilement;
end;
procedure TFormTest.HelpClick(Sender:TObject);
begin
  Label3D1.About:=Aide;
end;
procedure TFormTest.ColorBoxChange(Sender:TObject);
begin
  Label3D1.Color1:=ColorBox1.Selected;
  Label3D1.Color2:=ColorBox2.Selected;
  Label3D1.ColorFond:=ColorBoxFond.Selected;
  Label3D1.ColorMouse:=ColorBoxMouse.Selected;
  Label3D1.Interval:= StrToInt(Intervalle.Text);
  Label3D1.Ecart3D:=StrToInt(Ecart.Text);
  If Transparent.Checked Then Label3D1.Transparent:=True
  Else Label3D1.Transparent:= False;
end;
procedure TFormTest.TransparentClick(Sender:TObject);
begin
  If Transparent.Checked Then Label3D1.Transparent:=True
  Else Label3D1.Transparent:=False;
end;
procedure TFormTest.UDEcartChanging(Sender:TObject;var AllowChange:Boolean);
begin
  Label3D1.Ecart3D:=StrToInt(Ecart.Text);
end;
procedure TFormTest.UDIntervalleChanging(Sender:TObject;var AllowChange:Boolean);
begin
  Label3D1.Interval:=StrToInt(Intervalle.Text);
end;
procedure TFormTest.SortieClick(Sender:TObject);
begin
  Application.Terminate;
end;
end.
