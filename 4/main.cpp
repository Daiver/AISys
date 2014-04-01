#include <stdio.h>
#include <string.h>
#include <SWI-Prolog.h>

#define MAXLINE 1024

int main(int argc, char **argv)
{ 
    char expression[MAXLINE];
    char *e = expression;
    char *program = argv[0];
    char *plav[2];
    int n;

    /* combine all the arguments in a single string */

    for(n=1; n<argc; n++)
    { 
        if ( n != 1 )
            *e++ = ' ';
        strcpy(e, argv[n]);
        e += strlen(e);
    }
    /* make the argument vector for Prolog */
    plav[0] = program;
    plav[1] = NULL;
    /* initialise Prolog */
    if ( !PL_initialise(1, plav) )
        PL_halt(1);

    /* Lookup calc/1 and make the arguments and call */
    { 
        printf("Init succ\n");
        predicate_t pred = PL_predicate("calc", 1, "user");
        term_t h0 = PL_new_term_refs(1);
        int rval;
        PL_put_atom_chars(h0, expression);
        rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred, h0);
        //PL_halt(rval ? 0 : 1);

        predicate_t pred2 = PL_predicate("tmp", 1, "user");
        term_t h1 = PL_new_term_refs(1);
        rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred2, h1);
        int res;
        rval = PL_get_integer(h1, &res);
        printf("res %d\n", res);
        
        pred2 = PL_predicate("tmp2", 2, "user");

        PL_halt(rval ? 0 : 1);
    }
    return 0;
}


/*
#include <iostream>
#include <SWI-Prolog.h>

using namespace std;

int main(void){

 static char * av[] = {"calc.pl", NULL};
 if( ! PL_initialise(1,av)){
 cout<<"error initializing"<<endl;
 PL_halt(1);
 }else {
 cout<<"success initializing!"<<endl;
 }

 predicate_t pred = PL_predicate("calc",1,"user");
 term_t h0 = PL_new_term_refs(1);

 int rval;
 char * expression = "pi/2";
 PL_put_atom_chars(h0,expression);
 rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred, h0);
 PL_halt( rval ? 0 : 1 );

 return 0;
}
*/
