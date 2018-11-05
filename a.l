%{
	int _user_function=0,Keyword=0,_identifiers=0,_arithmatic_operator=0,_unary_operator=0,_logical_operator=0,_relational_operator=0,_assignment_operator=0,_library_function=0,_datatype=0,_loop=0,cndstatement=0,_integer=0,floatnum=0,_string=0,scmnt=0,mcmnt=0,newl=0;
%}
Datatype "int"|"float"
identifiers "prince_"[a-zA-Z]([a-zA-Z0-9])*
arithmatic_operator "jog"|"biyog"|"goon"|"bag"|"exp"
unary_operator "~++"|"~--"|"~~"|"~!"|"~+"|"~-"
logical_operator [&][&]|[|][|]|[!][!]
relational_operator "<<"|">>"|"<<="|">>="|"=="|"!="
assignment_operator [=]|"+="|"-="|"/="
import "import "[a-zA-Z]([a-zA-Z0-9])*
library_function "TAKEIN<"|"SHOWOUT>"
user_function "function"
conditional_statement "IF"|"ELSE"|"ELIF"
integer (-|\+)?[0-9]+
float [+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+Dat
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][m][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][m][/]
%%
{identifiers} {
	printf("identifiers");
	_identifiers++;
	}
{arithmatic_operator} {
	printf("arithmatic_operator");
	_arithmatic_operator++;
}
{unary_operator} {
	printf("unary_operator");
	_unary_operator++;
}
{logical_operator} {
	printf("logical_operator");
	_logical_operator++;
}
{relational_operator} {
	printf("relational_operator");
	_relational_operator++;
}
{assignment_operator} {
	printf("assignment_operator");
	_assignment_operator++;
}
{library_function} {
	printf("library_function :");
	_library_function++;
	Keyword++;
}
{user_function} {
printf("user_function");
_user_function++;
Keyword++;
}
"forloop ""LP "[0-9]+":"[0-9]+" RP" {
printf("for loop");
_loop++;
Keyword++;
}  
{conditional_statement} {printf("conditional_statement");cndstatement++;}
{Datatype} {
	printf("Datatype");
	_datatype++;
	Keyword++;
}
{import} {
printf("import a Headerfile");
Keyword++;
}
{integer} {_integer++;printf("Integer");}

{float} {floatnum++;printf("Float");}

{single_line_comment} {
printf("single line comment\n");
mcmnt++;
}
{multiple_line_comment} {
printf("multiple_line_comment");
}
"$$" {printf("NewLine\n");newl++;}
\n
{  
}  
%%
int yywrap(){
	return 1;
}
int main()
{
	yyin=freopen("in.txt","r",stdin);
	yyout=freopen("out.txt","w",stdout);
	yylex();	printf("\nIdentfiers=%d\narithmatic_operator=%d\nunary_operator=%d\n_logical_operator=%d\nrelational_operator=%d\nassignment_operator=%d\nlibrary_function=%d\ndatatype=%d\nloop=%d\nconditional_statement=%d\ninteger=%d\nfloatnum=%d\nNewLine=%d\nmcmnt=%d\n_user_function=%d\nKeyword=%d\n",_identifiers,_arithmatic_operator,_unary_operator,_logical_operator,_relational_operator,_assignment_operator,_library_function,_datatype,_loop,cndstatement,_integer,floatnum,newl,mcmnt,_user_function,Keyword);
	fclose(yyin);
	fclose(yyout);
}