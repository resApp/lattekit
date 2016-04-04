grammar Latte;

unit :  (packageDeclaration|importStatement|classDeclaration|code)*;

classDeclaration: LAYOUT_CLASS '{' classBody '}';
classBody: (layoutFunction|cssFunction|code)*;

code: codeChar+ | STRING_LITERAL | WS+
    | codeChar* '{' code* '}';

packageDeclaration: PACKAGE_DECLARATION;
importStatement: IMPORT_STMT;

cssFunction: CSS_FUN '(' cssString ')';

layoutFunction: LAYOUT_FUN '(' layoutString ')'
              | LAYOUT_FUN_BLOCK '(' layoutString ')' '}';


layoutString    : '"""' layoutBody '"""';
cssString       : '"""' cssBody '"""';
cssBody         :  cssChar+ | cssChar* '{' cssChar* '}' cssBody*;
cssChar         : CHAR|':'|WS;

layoutBody  : (xmlTag|inlineCode|CHAR|WS)*;
inlineCode  : '$'? '{' inlineCodeContent '}';

inlineCodeContent: codeBase+ | codeBase* '{' inlineCodeContent* '}';
codeBase         : layoutString | codeChar+ | STRING_LITERAL | WS+;

codeChar        : CHAR|'<'|'>'|'/>'|'/'|'('|')'|'"'|'='|'\'' | '@' |'$'| ':'|'xml'|'"""'|XML_TAG_OPEN;


xmlTag      : XML_TAG_OPEN WS* layoutProp* WS* '/>'
            | XML_TAG_OPEN WS* layoutProp* WS*'>' layoutBody XML_TAG_CLOSE
            ;
propName    : '@'? (CHAR+ ':')? CHAR+;
layoutProp  :   propName '='  STRING_LITERAL WS*
            |   propName '=' inlineCode WS*
            ;

strPropValue:  (CHAR|inlineCode|'\''|'@'|'/')*;


LAYOUT_CLASS : ('open'|'abstract') WS+ (('abstract'|'open') WS+)? 'class' WS+ ~[;{:,]+ WS* ':' WS* ~[;{:]+ WS*;

CSS_FUN: ('override' WS)? 'fun' WS+ ~[{=]+ WS* '=' WS* 'css';
LAYOUT_FUN: ('override' WS)? 'fun' WS+ ~[{=]+ WS* '=' WS* 'xml';
LAYOUT_FUN_BLOCK: ('override' WS)? 'fun' WS+ ~[{=]+ WS* '{' WS* 'xml';
BRACE_OPEN : '{';
BRACE_CLOSE : '}';
PAREN_OPEN : '(';
PAREN_CLOSE : ')';
CHAR: ~[<>/{}"= ];
XML_TAG_OPEN : '<' CHAR+;
XML_TAG_CLOSE :  '</' CHAR+ '>';
PACKAGE_DECLARATION: {getCharPositionInLine() == 0}? WS* 'package' WS+ ~[;\r\n ]+;
IMPORT_STMT: {getCharPositionInLine() == 0}? WS* 'import' WS+ ~[;\r\n ]+;

WS  :  [ \t\u000C]+;

STRING_LITERAL
  : UnterminatedStringLiteral '"'
  ;

UnterminatedStringLiteral
  : '"' (~["\\\r\n] | '\\' (. | EOF))*
  ;
