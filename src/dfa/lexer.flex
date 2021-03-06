import java_cup.runtime.Symbol;
import java.io.FileInputStream;
import java.io.InputStream;



%%
%class Lexer

%line
%column

%cup
%{

%}

LineTerminator = [\r|\n|\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]
number = 0|[1-9][0-9]*
   
identifier = [A-Za-z][A-Za-z0-9]*


%%

"List"           { /* System.out.println("List");         */ return new Symbol(sym.LIST);       }
"init"           { /* System.out.println("init");         */ return new Symbol(sym.INIT);       }
"empty"          { /* System.out.println("empty");        */ return new Symbol(sym.EMPTY);      }
"String"         { /* System.out.println("String");       */ return new Symbol(sym.STRING);     }
"Number"         { /* System.out.println("Number");       */ return new Symbol(sym.NUMBER);     }
"type"           { /* System.out.println("type");         */ return new Symbol(sym.TYPE);       }
"click"          { /* System.out.println("click");        */ return new Symbol(sym.CLICK);      }
"goto"           { /* System.out.println("goto");         */ return new Symbol(sym.GOTO);       }
"defaultState"   { /* System.out.println("defaultState"); */ return new Symbol(sym.DEFAULT);    }
"belongs_to"     { /* System.out.println("belongs_to");   */ return new Symbol(sym.BELONGSTO);  }
"statechart"     { /* System.out.println("statechart");   */ return new Symbol(sym.STATECHART); }
"state"          { /* System.out.println("state");        */ return new Symbol(sym.STATE);      }
"transition"     { /* System.out.println("transition");   */ return new Symbol(sym.TRANSITION); }
"source"         { /* System.out.println("source");       */ return new Symbol(sym.SRC);        }
"destination"    { /* System.out.println("destination");  */ return new Symbol(sym.DEST);       }
"guard"          { /* System.out.println("guard");        */ return new Symbol(sym.GUARD);      }
"action"         { /* System.out.println("action");       */ return new Symbol(sym.ACTION);     }
"done"           { /* System.out.println("done");         */ return new Symbol(sym.DONE);       }


":="             { /* System.out.println("assign");       */ return new Symbol(sym.ASSIGN);     }
"["              { /* System.out.println("LPAR_SQ");      */ return new Symbol(sym.LPAR_SQ);    }
"]"              { /* System.out.println("RPAR_SQ");      */ return new Symbol(sym.RPAR_SQ);    }
"."              { /* System.out.println("DOT");          */ return new Symbol(sym.DOT);        }
"{"              { /* System.out.println("LBRACE");       */ return new Symbol(sym.LBRACE);     }
"}"              { /* System.out.println("RBRACE");       */ return new Symbol(sym.RBRACE);     }
";"              { /* System.out.println("SEMICOLON");    */ return new Symbol(sym.SEMICOLON);  }
","              { /* System.out.println("COMMA");        */ return new Symbol(sym.COMMA);      }
":"              { /* System.out.println("COLON");        */ return new Symbol(sym.COLON);      }
"&"              { /* System.out.println("AND");          */ return new Symbol(sym.AND);        }
"!="             { /* System.out.println("NEQ");          */ return new Symbol(sym.NEQ);        }
{identifier}     { /* System.out.println("identifier = " + yytext()); */ 
                                                 return new Symbol(sym.IDENTIFIER,yytext());    }
{number}         { /* System.out.println("CONSTANT");     */ return new Symbol(sym.CONSTANT);   }
{WhiteSpace}     { /* do nothing */}

[^]              { throw new Error("Illegal character <"+yytext()+">"); }
