/* --- Copyright University of Sussex 1989. All rights reserved. ----------
 > File:            C.all/src/sect_widprop.p
 > Purpose:
 > Author:          John Gibson (see revisions)
 */

;;; ----------- MAPPING IDENTIFIERS TO WORD IDENTIFIERS ------------------

#_INCLUDE 'declare.ph'

;;; ---------------------------------------------------------------------

section $-Sys$-Sect;

    /*  vector of word identifiers generated by poplink
    */
constant
    word_ident_vec  = word_ident_vec;


    /*  Temporary property that relates identifiers to words
        that represent them
    */
lconstant procedure
    word_ident_prop = newproperty([], 64, false, "tmpboth");

define lvars get_word_ident();
    lvars n, wid;
    fast_for n to datalength(word_ident_vec) do
        fast_subscrv(n, word_ident_vec) ->> wid
                                -> word_ident_prop(wid!W_IDENTIFIER)
    endfast_for;
    chain(word_ident_prop ->> get_word_ident)
enddefine;

define word_idents() with_nargs 1;
    chain(get_word_ident)
enddefine;

updater(word_ident_prop) -> updater(word_idents);

endsection;



/* --- Revision History ---------------------------------------------------
--- John Gibson, Jun  7 1989
        "tmpboth" for word_ident_prop
--- John Gibson, Jan 29 1989
        Uses -word_ident_vec- generated by poplink to get built-in
        word identifiers
--- John Gibson, Mar 27 1988
        Split from sections.p
 */