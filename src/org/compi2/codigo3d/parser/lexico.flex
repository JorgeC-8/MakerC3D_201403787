package org.compi2.codigo3d.parser;

import java_cup.runtime.Symbol;

//Scanner para generar C3D
%%
%{
    //Código de usuario
    

%}

%cup
%class scanner
%public
%line
%char
%column
%full

MAS		= "+"
MENOS		= "-"
MULT       	= "*"
DIV             = "/"
POT             = "^"
PAR_IZQ         = "("
PAR_DER         = ")"

IGUAL		= "=="
DIFERENTE		= "!="
MAYOR       	= ">"
MENOR            = "<"
MAYORI             = ">="
MENORI         = "<="
Y         = "&&"
O         = "||"
NO         = "!"

ID              = [A-Za-z][_0-9A-Za-z]*
ENTERO          = [0-9]+
DECIMAL         = [0-9]+"."[0-9]+

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%

<YYINITIAL> {ID}            { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }
<YYINITIAL> {ENTERO}        { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
<YYINITIAL> {DECIMAL}       { return new Symbol(sym.DECIMAL, yyline, yycolumn, yytext()); }
<YYINITIAL> {MAS}           { return new Symbol(sym.MAS, yyline, yycolumn, null); }
<YYINITIAL> {MENOS}	    { return new Symbol(sym.MENOS, yyline, yycolumn, null); }
<YYINITIAL> {MULT}          { return new Symbol(sym.MULT, yyline, yycolumn, null); }
<YYINITIAL> {DIV}	    { return new Symbol(sym.DIV, yyline, yycolumn, null); }
<YYINITIAL> {POT}	    { return new Symbol(sym.POT, yyline, yycolumn, null); }
<YYINITIAL> {PAR_IZQ}	    { return new Symbol(sym.PAR_IZQ, yyline, yycolumn, null); }
<YYINITIAL> {PAR_DER}	    { return new Symbol(sym.PAR_DER, yyline, yycolumn, null); }


<YYINITIAL> {IGUAL}            { return new Symbol(sym.IGUAL, yyline, yycolumn, yytext()); }
<YYINITIAL> {DIFERENTE}        { return new Symbol(sym.DIFERENTE, yyline, yycolumn, yytext()); }
<YYINITIAL> {MAYOR}       { return new Symbol(sym.MAYOR, yyline, yycolumn, yytext()); }
<YYINITIAL> {MENOR}           { return new Symbol(sym.MENOR, yyline, yycolumn, null); }
<YYINITIAL> {MAYORI}	    { return new Symbol(sym.MAYORI, yyline, yycolumn, null); }
<YYINITIAL> {MENORI}          { return new Symbol(sym.MENORI, yyline, yycolumn, null); }
<YYINITIAL> {NO}	    { return new Symbol(sym.NO, yyline, yycolumn, null); }
<YYINITIAL> {Y}	    { return new Symbol(sym.Y, yyline, yycolumn, null); }
<YYINITIAL> {O}	    { return new Symbol(sym.O, yyline, yycolumn, null); }

<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}

<YYINITIAL>. {
        String errLex = "Error léxico, caracter irreconocible: '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+yycolumn;
        System.err.println(errLex);
}