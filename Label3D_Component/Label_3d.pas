unit Label_3D;    // Composant Label3D - (C) Guy Bidi Février 2007 réactualisé
interface
uses Windows,SysUtils,Classes,Controls,StdCtrls,Types,Graphics,ExtCtrls,Forms,Dialogs;
Const Mess =#13+'  1 - About : CopyRight ou Aide Actuelle'+#13+#13+
      '  2 - LabelType : Choix entre un Texte en Relief'+#13+
      '                           ou Clignotant ou Défilant.'#13+#13+
      '  3 - Ecart3D : Valeur de relief pour simuler le 3D'+#13+#13+
      '  4 - Color1/Color2 : Couleur de 1er et 2'#232'me plan pour '+#13+
      '                               le Relief et le Clignotement'+#13+#13+
      '  5 - ColorFond : Couleur du fond rectangulaire du Label'+#13+#13+
      '  7 - ColorMouse: Couleur au passage de la souris'+#13+#13+
      '  8 - Interval  : Temps du Timer pour le clignotement'+#13+#13+
      '  9 - Transparent : Si oui active la couleur du Fond'+#13+#13+
      ' 10 - Caption : Texte du Label3D'+#13+#13+
      ' Décompilation/Modification interdite sans l''accord'+#13+
      '  de l''auteur  ® Guy Bidi - 2007 : Paounet@free.fr'+#13+#13;
      Bulle='Double-Cliquer pour sortir';
 type
  TStyleRelief = (Relief,Clignotant,Defilement);
  TAbout= (Copyright_Guy_Bidi,Aide);
  Label3D = class(TGraphicControl)
  private     { Déclarations privées }
    Rectangl:TRect;FColor1,FColor2,FColorFond,FColorMouse:TColor;
    FTemps,FEcart:Integer;Timer:TTimer;FStyleRelief:TStyleRelief;
    FCaption:String;FTransparent:Boolean;
    FAbout:TAbout;FormAide:TForm;Memo:TMemo;Image:TImage;
    Procedure SetColor1(const Value:TColor);
    Procedure SetColor2(const Value:TColor);
    procedure SetTemps(const Value:Integer);
    procedure SetEcart(const Value:Integer);
    procedure SetStyleRelief(const Value:TStyleRelief);
    procedure SetTransparent(const Value:Boolean);
    procedure SetColorFond(const Value:TColor);
    procedure SetColorMouse(const Value:TColor);
    procedure SetCaption(const Value:String);
    procedure SetAbout(const Value:TAbout);
    Procedure SetTimer(Valeur:Integer;Flag:Boolean);
   protected   { Déclarations protégées }
    Procedure LabelMove(Sender:TObject;Shift:TShiftState;X,Y:Integer);
    Procedure LabelLeave(Sender:TObject);
    Procedure Paint;Override;
    procedure MemoDblClick(Sender:TObject);
    Procedure OnTimer(Sender:TObject);Virtual;
  public      { Déclarations publiques }
    Destructor Destroy;override;
    Constructor Create (Aowner:Tcomponent);Override;
  published   { Déclarations publiées }
    property About:TAbout Read FAbout Write SetAbout Default Copyright_Guy_Bidi;
    Property Ecart3D:Integer Read FEcart Write SetEcart;
    Property LabelType:TStyleRelief Read FStyleRelief Write SetStyleRelief Default Relief;
    Property Color1:TColor Read FColor1 Write SetColor1;
    Property Color2:TColor Read FColor2 Write SetColor2;
    Property ColorFond:TColor Read FColorFond Write SetColorFond;
    Property ColorMouse:TColor Read FColorMouse Write SetColorMouse Default clHighlight;
    property Interval:Integer Read FTemps write SetTemps;
    Property Transparent:Boolean Read FTransparent Write SetTransparent;
    Property Caption:String Read FCaption write SetCaption;
    Property Visible;
    Property Font;
    Property OnClick;
    Property OnDblClick;
  end;
  Var Index:Integer;Temp:String;
procedure Register;
implementation
{$R MyResources.res}
procedure Register;
begin
  RegisterComponents('Guy Bidi', [Label3D]);
end;
destructor Label3D.Destroy;
begin
  inherited Destroy;
end;
constructor Label3D.Create(Aowner:TComponent);
begin
  inherited Create(Aowner);
  Color1:=ClBlack;Color2:=ClRed;Transparent:=True;ColorFond:=clWhite;
  Ecart3D:=1;LabelType:=Relief;Timer:=TTimer.Create(Self);Interval:=500;
  Timer.Interval:=FTemps;Timer.OnTimer:=OnTimer;Timer.Enabled:=False;
  Caption:='© Guy Bidi 2007';FormAide:=TForm.CreateNew(Application);
  OnMouseMove:=LabelMove;OnMouseLeave:=LabelLeave;FColorMouse:=clHighlight;
  ColorMouse:=FColorMouse;Index:=0;Temp:=Caption;
  With FormAide Do Begin Left:=0;Top:=0;BorderIcons:=[biSystemMenu];
  BorderStyle:=bsSingle;Height:=506;Width:=367;
  Caption:='Les Propriétés du Composant Label3D';Position:=poScreenCenter;
  Icon.LoadFromResourceName(Hinstance,'AIDE');Color:=clMoneyGreen;
  Hint:=Bulle;ShowHint:= True;OnDblClick:=MemoDblClick;End;
  Memo:=TMemo.Create(Owner);With Memo Do Begin Parent:=FormAide;Left:=0;Top:=58;
  Hint:=Bulle;Color:=clMoneyGreen;Enabled:=True;
  Font.Charset:=DEFAULT_CHARSET;Font.Color:=clBlack;Font.Height:=-13;
  Font.Name:='Segoe UI';Font.Style:=[fsBold];ParentShowHint:= False;
  ReadOnly:= True;ShowHint:= True;Lines.Text:=Mess;Height:=393;Width:=361;
  BorderStyle:=bsNone;WantReturns:=True;OnDblClick:=MemoDblClick;Align:=alCustom;End;
  Image:=TImage.Create(Owner);With Image Do Begin
  Parent:=FormAide;Left:=95;Top:=10;Height:=47;Width:=159;
  Picture.Bitmap.LoadFromResourceName(Hinstance,'IMAGE0');AutoSize:=True;
  OnDblClick:=MemoDblClick;End;
end;
Procedure Label3D.LabelMove(Sender:TObject;Shift:TShiftState;X,Y:Integer);
Begin                 // Passe la Couleur en HighLight
  if FStyleRelief=Relief then Begin
    Canvas.Brush.Style:=bsClear;Canvas.Font.Color:=FColorMouse;
    Rectangl:=Rect(0,0,Width,Height);
    DrawText(Canvas.Handle,PWideChar(Caption),-1,Rectangl,0);End;
End;
Procedure Label3D.LabelLeave(Sender:TObject);
Begin                 // Recupere la Couleur d'Origine
  Invalidate;
End;
Procedure Label3D.SetTimer(Valeur:Integer;Flag:Boolean);
Begin
  With Timer Do Begin Interval:=Valeur;Enabled:=Flag;End;
End;
procedure Label3D.MemoDblClick(Sender:TObject);
Begin
  SetTimer(500,False);FormAide.ModalResult:=mrOk;
End;
procedure Label3D.SetColorMouse(const Value:TColor);
Begin
  If Value<>FColorMouse then Begin FColorMouse:=Value;ColorMouse:=FColorMouse;
    Invalidate;End;
End;
procedure Label3D.SetAbout(const Value:TAbout);
Begin
  If Value<>FAbout then FAbout:=Value;If Value=Aide Then Begin
    SetTimer(220,True);FormAide.ShowModal;FAbout:=Copyright_Guy_Bidi;End;
   Invalidate;
End;
Procedure Label3D.Paint;
begin
  inherited Paint;
  Canvas.Font.Size:=Font.Size;Canvas.Font.Style:=Font.Style;
  Canvas.Font.Name:=Font.Name;Width:=Canvas.TextWidth(Temp)+Ecart3D;
  Height:=Canvas.TextHeight(Temp)+Ecart3D;
  If LabelType=Relief then Timer.Enabled:=False;
    begin
      If not Transparent then begin
          Canvas.Brush.Style:=bsSolid;Canvas.Brush.Color:=ColorFond;
          Canvas.FillRect(Rect(0,0,Width,Height));end
        else begin        // Texte 2eme plan
          Canvas.Brush.Style:=bsClear;Canvas.Font.Color:=Color2;
          Rectangl:=Rect(Ecart3D,Ecart3D,Width+Ecart3D,Height+Ecart3D);
          DrawText(Canvas.Handle,PWideChar(Temp),-1,Rectangl,0);end;
    End;
                  //Texte premier plan
  Canvas.Brush.Style:=bsClear;Canvas.Font.Color:=Color1;
  Rectangl:=Rect(0,0,Width,Height);
  DrawText(Canvas.Handle,PWideChar(Temp),-1,Rectangl,0);
end;
procedure Label3D.OnTimer(Sender:TObject);
var I:Integer;STextDefil,TextDefil:String;
begin
  If FStyleRelief=Defilement then begin                 // Defilement du Texte
    TextDefil:=Temp; For i:=2 to Length(TextDefil) do
      STextDefil:=STextDefil+TextDefil[i];STextDefil:=STextDefil+TextDefil[1];
      Temp:=STextDefil;Invalidate;end Else
  If Not(FormAide.Visible) then With Canvas Do Begin    // Clignotement
    If Font.Color=Color1 then Font.Color:=Color2 Else Font.Color:=Color1;
      Brush.Style:=bsClear;  Rectangl:=Rect(0,0,Width,Height);
      DrawText(Canvas.Handle,PWideChar(Temp),-1,Rectangl,0);End
  Else Begin Inc(Index);If Index>3 Then Index:=0;     // Memo du Texte
    Image.Picture.Bitmap.LoadFromResourceName(Hinstance,'IMAGE'+IntToStr(Index));
    End;
end;
procedure Label3D.SetCaption(const Value:String);
begin
  If Value<>FCaption then Begin FCaption:=Value;Caption:=Value;Temp:=Caption;
  end;Invalidate;
end;
procedure Label3D.SetColor1(const Value:TColor);
begin
  If Value<>FColor1 then begin FColor1:=Value;Color1:=Value;Invalidate;end;
end;
procedure Label3D.SetColor2(const Value:TColor);
begin
  If Value<>FColor2 then begin FColor2:=Value;Color2:=Value;Invalidate;end;
end;
 procedure Label3D.SetTemps(const Value:Integer);
begin
  If Value<>FTemps then begin FTemps:=Value;Timer.Interval:=Value;Invalidate;end;
end;
procedure Label3D.SetEcart(const Value:Integer);
begin
  If Value<>FEcart then begin FEcart:= Value;Invalidate;end;
end;
procedure Label3D.SetStyleRelief(const Value:TStyleRelief);
begin
  Temp:=Caption;
  If Value<>FStyleRelief then begin FStyleRelief:=Value;
    If (Value=Clignotant) or (Value=Defilement) Then Begin Caption:=Temp;
      Timer.Enabled:=True;Invalidate;End;End;
end;
procedure Label3D.SetTransparent(const Value:Boolean);
begin
  If Value<>FTransparent then begin FTransparent := Value;Invalidate;end;
end;
procedure Label3D.SetColorFond(const Value:TColor);
begin
  If Value<>FColorFond then begin FColorFond := Value;Invalidate;end;
end;
end.

