#include <stdio.h>
#include <string.h>
#include <SWI-Prolog.h>

#define MAXLINE 1024

int main(int argc, char **argv)
{ 
    /*char expression[MAXLINE];
    char *e = expression;
    int n;*/
    char *plav[2];
    char *program = argv[0];

    /* combine all the arguments in a single string */

    /*for(n=1; n<argc; n++)
    { 
        if ( n != 1 )
            *e++ = ' ';
        strcpy(e, argv[n]);
        e += strlen(e);
    }*/
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
        /*term_t h0 = PL_new_term_refs(1);
        int rval;
        //PL_put_atom_chars(h0, expression);
        //rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred, h0);
        //PL_halt(rval ? 0 : 1);

        predicate_t pred2 = PL_predicate("tmp", 1, "user");
        term_t h1 = PL_new_term_refs(1);
        rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred2, h1);
        int res;
        rval = PL_get_integer(h1, &res);
        printf("res %d\n", res);*/
        
        term_t h1 = PL_new_term_refs(3);
        PL_put_integer(h1, 100);
        //pred2 = PL_predicate("tmp2", 3, "user");
        predicate_t pred2 = PL_predicate("classify", 3, "user");

        int rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred2, h1);
        char *ch;
        rval = PL_get_chars(h1 + 1, &ch, CVT_WRITE);
        //rval = PL_get_atom_chars(h1 + 1, &ch);
        //rval = PL_get_integer(h1 + 1, &res);
        //printf("res %d\n", res);
        printf("res %s\n", ch);
        rval = PL_get_chars(h1 + 2, &ch, CVT_WRITE);
        printf("res %s\n", ch);

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
